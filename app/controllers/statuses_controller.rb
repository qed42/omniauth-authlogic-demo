class StatusesController < ApplicationController
  before_filter :require_user, :only => [:create]

  def create
    @status = current_user.statuses.build(params[:status])
    if @status.save
      flash[:notice] = "Successfully posted"
    else
      flash[:error] = 'Status '+@status.errors[:message]
    end
    redirect_to root_url
  end

  def index
    @statuses = Status.recent
  end
end
