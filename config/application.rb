require_relative 'boot'

require 'csv'
require 'pry'
require 'rails/all'

Bundler.require(*Rails.groups)

module GympassKartRacing
  class Application < Rails::Application
    config.load_defaults 5.2
  end
end
