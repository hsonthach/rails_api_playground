# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
Rails.application.load_server
Rails.application.routes.default_url_options[:host] = ENV['HOST_URL']
