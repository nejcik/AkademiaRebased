require 'bundler'
Bundler.require(:default)
require 'sinatra/reloader'
require_relative 'cells'

# class App < Sinatra::Base

  gameboard = Cells.new 

  get '/' do
    gameboard.start
    erb :index, :locals => {:board => gameboard}
  end

  post '/' do
    # gameboard.check_neighbours
    gameboard.check_neighbours
    play_game = gameboard.check_if_cleaned
    # puts play_game
    erb :game, :locals => {:board => gameboard, :play => play_game}
  end

  post '/restart' do
    redirect '/'
  end
  
# end