class StatusesController < ApplicationController
  before_filter :require_user, :only => [:create]
  
  def create
    @status = Status.new(params[:status])
    @status.user_id = current_user.id
    if @status.save
      flash[:notice] = "Successfully posted"
    else
      flash[:error] = 'Status '+@status.errors[:message]
    end
    redirect_to root_url
  end
  
  def index
    @statuses = Status.all :order => 'created_at desc'
  end
end
