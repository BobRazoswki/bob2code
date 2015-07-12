ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require 'database_cleaner'
require_relative '../app/controller.rb'
Capybara.app = Sinatra::Application.new


RSpec.configure do |config|
  config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
end
