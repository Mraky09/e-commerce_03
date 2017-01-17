class MonthlyMailer < ApplicationMailer
  def mail_month
    admins = User.email_of_all_admins
    date = Time.now
    start_date = date.beginning_of_month
    end_date = date.end_of_month
    @orders = Order.order_in_month start_date, end_date
    @hot_trend_products = Product.hot_trend
    mail to: admins.map(&:email).uniq, subject: t("report")
  end
end
