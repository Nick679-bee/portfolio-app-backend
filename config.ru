require "dotenv/load"
require "./app"
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'bcrypt'
require 'json'

run Sinatra::Application
