require 'bundler'

Bundler.require(:default)

require 'sinatra/reloader'
require_relative 'simple_user'

get '/' do
  erb :index
end

post '/logged' do
  password = params[:password]

  erb :logged, :locals => {'password' => password}
end

post '/' do
  erb :index
end