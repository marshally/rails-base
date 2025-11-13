# frozen_string_literal: true

namespace :sidekiq do
  desc "Test Sidekiq setup by checking configuration"
  task test: :environment do
    puts "Testing Sidekiq configuration..."
    puts "Redis URL: #{Sidekiq.redis { |conn| conn.connection[:host] }}:#{Sidekiq.redis { |conn| conn.connection[:port] }}"
    puts "Sidekiq is configured and ready!"
    puts "Visit Sidekiq Web UI at: http://localhost:3000/sidekiq (development only)"
  end
end
