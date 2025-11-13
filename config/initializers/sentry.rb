# frozen_string_literal: true

# Skip Sentry initialization in test environment
return if Rails.env.test?

# Skip if no DSN is provided
return unless ENV["SENTRY_DSN"]

# Configure Sentry for error tracking and performance monitoring
Sentry.init do |config|
  # Set your Sentry DSN via SENTRY_DSN environment variable
  config.dsn = ENV.fetch("SENTRY_DSN", nil)

  # Set the environment (development, staging, production)
  config.environment = Rails.env

  # Set the release version (useful for tracking deployments)
  config.release = ENV.fetch("SENTRY_RELEASE", nil)

  # Configure sampling rates for performance monitoring
  config.traces_sample_rate = case Rails.env
                              when "production"
                                0.1 # 10% of transactions in production
                              when "staging"
                                0.5 # 50% of transactions in staging
                              else
                                1.0 # 100% of transactions in development
                              end

  # Configure profiles sampling rates
  config.profiles_sample_rate = case Rails.env
                                when "production"
                                  0.1 # 10% of profiles in production
                                when "staging"
                                  0.5 # 50% of profiles in staging
                                else
                                  1.0 # 100% of profiles in development
                                end

  # Configure breadcrumbs logging
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
end
