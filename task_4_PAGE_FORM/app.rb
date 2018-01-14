require 'bundler'

Bundler.require(:default)

require 'sinatra/reloader'
require_relative 'simple_user'


class App < Sinatra::Base
  user = SimpleUser.new

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
end