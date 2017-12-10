gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game'
require_relative 'point'
require_relative 'board'
require_relative 'player'

class GameTest<Minitest::Test 
	def test_default_number_of_iterations
		game=Game.new
		game.cells=Board.new
		game.set_num_iterations(game.cells.max_size)
		assert_equal 9, game.num_iterations
	end

	def test_symbol_for_second_player_should_be_different
		game=Game.new
		symbol="O"
		symbol_2=game.which_symbol(symbol)
		assert_equal "X", symbol_2
	end

	def test_no_accept_wrong_symbol
		game=Game.new
		symbol="C"
		assert_equal 0, game.check_symbol(symbol)
	end

	def test_proper_point_input
		game=Game.new
		point_input="123"
		assert_equal 0, game.check_point_input(point_input)
	end

	def test_point_should_not_exceed_board
		game=Game.new
		game.cells=Board.new
		point=Point.new("B4","O")
		assert_equal 1, game.check_point(point)
	end
	
end
