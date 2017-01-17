class RequestsController < ApplicationController
  def index
    @requests = Request.order(created_at: :desc).where("user_id = ?", current_user.id)
      .page(params[:page]).per Settings.user.requests.per_page
  end

  def create
    @request = current_user.requests.build request_params
    if @request.save
      flash[:success] = t ".request_success"
    else
      flash[:danger] = t ".request_failed"
    end
    redirect_to root_url
  end

  private
  def request_params
    params.permit :content
  end
end
