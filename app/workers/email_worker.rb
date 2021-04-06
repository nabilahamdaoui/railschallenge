class EmailWorker
  include Sidekiq::Worker

  def perform(message, emails)
    emails.each do |email|
      NotificationMailer.notify(email, message).deliver
    end

  end
end
