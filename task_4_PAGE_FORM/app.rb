require 'bundler'

Bundler.require(:default)

require 'sinatra/reloader'


get '/' do
  erb :index
end

post '/logged' do
  erb :logged
end

post '/' do
  erb :index
end