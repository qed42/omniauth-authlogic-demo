class AuthorizationsController < ApplicationController
  before_filter :require_user, :only => [:destroy]

  def create
    omniauth = request.env['rack.auth'] #this is where you get all the data from your provider through omniauth
    @auth = Authorization.find_from_hash(omniauth)
    if current_user
      flash[:notice] = "Successfully added #{omniauth['provider']} authentication"
      current_user.authorizations.create(:provider => omniauth['provider'], :uid => omniauth['uid']) #Add an auth to existing user
    elsif @auth
      flash[:notice] = "Welcome back #{omniauth['provider']} user"
      UserSession.create(@auth.user, true) #User is present. Login the user with his social account
    else  
      @new_auth = Authorization.create_from_hash(omniauth, current_user) #Create a new user
      flash[:notice] = "Welcome #{omniauth['provider']} user. Your account has been created."
      UserSession.create(@new_auth.user, true) #Log the authorizing user in.
    end
    redirect_to root_url
  end
  
  def failure
    flash[:notice] = "Sorry, You din't authorize"
    redirect_to root_url
  end
  
  def destroy
    @authorization = current_user.authorizations.find(params[:id])
    flash[:notice] = "Successfully deleted #{@authorization.provider} authentication."
    @authorization.destroy
    redirect_to root_url
  end
end
