class Admin::RequestsController < ApplicationController
  before_action :authenticate_user!, :is_admin?
  load_and_authorize_resource
  layout "admin"

  def index
    @requests = Request.order(created_at: :desc)
      .page(params[:page]).per Settings.admin.requests_list.per_page
  end

  def update
    if params[:request][:status] == "accepted"
      @request.update_attributes status: :accepted
    else
      @request.update_attributes status: :rejected
    end
    flash[:success] = t ".success"
    redirect_to admin_requests_url
  end
end
