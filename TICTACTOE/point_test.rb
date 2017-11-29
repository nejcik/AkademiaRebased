gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'point'


class PointTest < Minitest::Test
	def test_point_has_an_original_value
		point=Point.new("A1","O")
		assert_equal "A1", point.original_value
	end	

	def test_point_has_a_symbol
		point=Point.new("A1","O")
		assert_equal "O", point.symbol
	end

	def test_change_to_x
		point=Point.new("A1","O")
		assert_equal 1, point.x
	end

	def test_change_to_y
		point=Point.new("A1","O")
		assert_equal 1, point.y
	end

	def test_change_to_y
		point=Point.new("B3","X")
		assert_equal 5, point.y
	end


	def test_not_change_to_y
		point=Point.new("C4","O")
		refute_equal 4, point.y
	end

	def test_not_change_to_y
		point=Point.new("B3","O")
		refute_equal 2, point.y
	end

	def test_set_proper_weight
		point=Point.new("B3","X")
		assert_equal 1, point.weight
	end
end
