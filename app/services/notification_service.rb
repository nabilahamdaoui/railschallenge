class NotificationService

  def self.notify_users(message)
    # Idea: Configure which notifications to send (all, email_only, webhook_only...)
    EmailWorker.perform_async(message, User.where(archived: false).collect(&:email)) # Notify active users only
    WebhookWorker.perform_async(message)
  end
end