class MonthlyWorker
  include Sidekiq::Worker

  def perform
    MonthlyMailer.mail_month.deliver_now
  end
end
