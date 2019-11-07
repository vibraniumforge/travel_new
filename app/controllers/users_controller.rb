# frozen_string_literal: true

class UsersController < ApplicationController
  get '/login' do
    if logged_in?(session)
      redirect to '/places'
    else
      erb :'/users/login'
    end
  end

  get '/signup' do
    redirect to '/places' if logged_in?(session)
    erb :'/users/create_user'
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if !@user.nil?
      redirect to '/places'
    else
      erb :'/users/login'
    end
  end

  post '/signup' do
    if !params.value?('') && params[:password].size >= 4
      @user = User.create(params)
      session[:user_id] = @user.id
      flash[:message] = 'User successfully created.'
      redirect to '/places'
    else
      flash[:message] = 'Fields cannot be empty. Password must be at least 4 characters long.'
      redirect to 'users/signup'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = 'Login successful.'
      redirect to '/places'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?(session)
      session.clear
      flash[:message] = 'Logout successful.'
    else
      redirect to '/'
    end
    redirect to '/login'
  end
end
