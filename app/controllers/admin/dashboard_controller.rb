class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!, :is_admin?
  layout "admin"

  def index
    if params[:start_at].present? || params[:end_at].present?
      @users_created_one_month_ago = User
        .group_by_day(:created_at).where("created_at > ? and created_at < ?", params[:start_at], params[:end_at]).count
      @orders_created_in_a_week = Order
        .group_by_day_of_week(:created_at, format: "%a").count
      @sale_in_month = Order
        .group_by_day(:created_at).where("created_at > ? and created_at < ?", params[:start_at], params[:end_at]).sum(:total_money)
    elsif
      @users_created_one_month_ago = User
        .group_by_day(:created_at, last: Settings.chart.weeks).count
      @orders_created_in_a_week = Order
        .group_by_day_of_week(:created_at, format: "%a").count
      @sale_in_month = Order
        .group_by_day(:created_at, last: Settings.chart.weeks).where(status: :delivered).sum(:total_money)

    end
  end
end
