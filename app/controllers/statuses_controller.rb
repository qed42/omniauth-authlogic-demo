class StatusesController < ApplicationController
  before_filter :require_user, :only => [:new]
  
  def new
    @status = Status.new
  end
  
  def create
    @status = Status.new(params[:status])
    if @status.save
      flash[:notice] = "Successfully created status."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def index
    @statuses = Status.all
  end
end
