require "sinatra/activerecord"
require "sinatra/flash"
require "bcrypt"
require "json"

class UsersController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect "/projects"
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect "/users/new"
    end
  end

  get "/login" do
    erb :"users/login"
  end

  post "/login" do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/projects"
    else
      flash[:error] = "Invalid email or password"
