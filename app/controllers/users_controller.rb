class UsersController < ApplicationController
  before_filter :find_user, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created."
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @authorizations = @user.authorizations if current_user
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated."
      redirect_to root_url
    else
      render :edit
    end
  end

  protected
  def find_user
    @user = User.find(params[:id])
  end

end
