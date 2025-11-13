# frozen_string_literal: true

namespace :spec do
  desc "Run all specs"
  task all: :environment do
    system("bundle exec rspec")
  end

  desc "Run specs with coverage"
  task coverage: :environment do
    ENV["COVERAGE"] = "true"
    system("bundle exec rspec")
  end
end
