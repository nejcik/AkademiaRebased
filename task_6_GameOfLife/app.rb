require 'bundler'
Bundler.require(:default)
require 'sinatra/reloader'

# class App < Sinatra::Base
  get '/' do
    erb :index    
  end

  post '/' do
    erb :index2
  end
  
# end