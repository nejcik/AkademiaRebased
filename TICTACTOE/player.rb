class Player
	attr_accessor :name, :symbol, :number_of_winnings

	def initialize(name="Player",symbol)
		@name =name
		@symbol=symbol
		@number_of_winnings=0
	end

	def add_win
		@number_of_winnings+=0
	end

end