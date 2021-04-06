require 'net/http'

class WebhookWorker
  include Sidekiq::Worker

  def perform(message)
    return unless (webhook_url = Rails.configuration.webhook_url)
    uri = URI(webhook_url)

    Net::HTTP.post_form(uri, 'message' => message)

    # TODO: If failed retry
  end


end