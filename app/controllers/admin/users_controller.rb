class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource
  layout "admin"

  def index
    @search = User.ransack params[:q]
    @users = @search.result.select(:name, :email, :role).order(created_at: :DESC)
      .page(params[:page]).per Settings.admin.users_list.per_page
  end
end
