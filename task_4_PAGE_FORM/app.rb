require 'bundler'

Bundler.require(:default)

require 'sinatra/reloader'
require_relative 'simple_user'
require_relative 'forgot_password'


class App < Sinatra::Base
  user = SimpleUser.new
  user.update_password

  get '/' do
    if user.current_user 
      redirect '/logged' 
    else 
      erb :index
    end
  end

  post '/' do
    user.current_user = false

    erb :index
  end

  get '/logged' do
    if user.current_user 
      erb :logged
    else 
      redirect '/'
    end
  end

  post '/logged' do
    user.input_password = params[:password]
    if user.check_password(user.input_password)
      user.current_user = true
      erb :logged
    else
      redirect '/'
    end
  end

  get '/forgot_password' do
    erb :forgot_password
  end

  post '/changed' do
    new_password = params[:new_password]
    check_password = params[:check_password]
    check = change_password(new_password,check_password)
    if check == true 
      user.update_password
      erb :changed
    else
      redirect :forgot_password
    end
  end
end
