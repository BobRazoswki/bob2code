ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require_relative '../app/controller.rb'
Capybara.app = Sinatra::Application.new


RSpec.configure do |config|

end
