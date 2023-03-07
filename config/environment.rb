ENV["RACK_ENV"] ||= "production"
require 'require_all'
require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])

require_all "app"