# frozen_string_literal: true

Dotenv.load if Rails.env.development? || Rails.env.test?

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end
