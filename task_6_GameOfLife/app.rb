require 'bundler'
Bundler.require(:default)
require 'sinatra/reloader'
require 'cells'

# class App < Sinatra::Base
  get '/' do
    # gameboard = Cells.new
    erb :index    
  end

  post '/' do
    erb :index2
  end
  
# end