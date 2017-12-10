gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'player'

class PlayerTest< Minitest::Test 
	def test_player_should_have_default_name
		player=Player.new("Player","O")
		assert_equal "Player", player.name
	end

	def test_player_should_have_symbol
		player=Player.new("Player","O")
		assert_equal "O", player.symbol
	end


	def test_second_player_should_have_different_symbol
		player=Player.new("Player1","O")
		player2=Player.new("Player2","X")
		assert_equal false, player.symbol == player2.symbol
	end

	def test_new_player_should_have_no_winnings 
		player=Player.new("Player1","O")
		assert_equal 0, player.number_of_winnings
	end 
end