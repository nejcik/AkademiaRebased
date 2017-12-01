gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'board'
require_relative 'point'

class BoardTest < Minitest::Test
	def test_new_board_has_no_points
		board=Board.new 
		point=Point.new("A1","O")
		refute board.game_board.include?(point) 
	end

	def test_board_point_weigt_proper_value
		board=Board.new 
		point=Point.new("A1","O")
		board.add_point(point)
		assert_equal -1, board.points_weights[0][0]
	end

	def test_check_winner
		board=Board.new 
		point1=Point.new("A1","O")
		point2=Point.new("B1","O")
		point3=Point.new("C1","O")
		board.add_point(point1)
		board.add_point(point2)
		board.add_point(point3)

		assert_equal true, board.is_win		
	end
end