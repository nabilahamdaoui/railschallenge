require 'sidekiq'

redis_url = ENV['REDIS_URL']

if redis_url.blank?
  puts 'WARN: REDIS_URL not found'
else
  Sidekiq.configure_client do |config|
    config.redis = {url: redis_url}
  end

  Sidekiq.configure_server do |config|
    config.redis = {url: redis_url}
  end

  Rails.logger.info "SIDEKIQ IS USING #{ redis_url }."
end


