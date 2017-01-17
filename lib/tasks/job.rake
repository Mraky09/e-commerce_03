namespace :job do
  desc "TODO"
  task mailmonth: :environment do
    MonthlyWorker.perform_async
  end
end
