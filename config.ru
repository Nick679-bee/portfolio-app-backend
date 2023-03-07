require "dotenv/load"
require "./app"
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'bcrypt'
require 'json'
require require_relative './config/environment'

use ProjectController
use SkillController
run UserController


run Sinatra::Application
