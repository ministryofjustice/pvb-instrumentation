# frozen_string_literal: true
require 'bundler/setup'
require 'active_support/all'
require 'pvb/instrumentation'
require 'byebug'

Dir[File.expand_path('../support/*.rb', __FILE__)].each do |path|
  require path
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    RequestStore.clear!
  end
end
