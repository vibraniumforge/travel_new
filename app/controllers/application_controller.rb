# frozen_string_literal: true

require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'password_security'
    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  def current_user(session)
    @user = User.find_by_id(session[:user_id])
    @user if @user.is_a?(User)
  end

  def logged_in?(session)
    User.find_by_id(session[:user_id])
  end
end
