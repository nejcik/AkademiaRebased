class Point < Board
	attr_accessor :original_value, :x, :y, :symbol, :weight


	def initialize(value,players_symbol)
		@original_value=value
		@symbol = players_symbol
		proper_value(original_value)
		set_weight(symbol)
	end

	def proper_value(original)
		# implement changing from "A1" to  (1,1)
		val_x =original[0].ord-64
		val_y = original[1].to_i

		@x=change_to_point(val_x)
		@y=change_to_point(val_y)
	end

	def change_to_point(previous_value)
		point_of_vector=2*previous_value-1
	end

	def set_weight(symbol)
		if symbol =="X"
			@weight = 1
		elsif symbol == "O"
			@weight = 2
		else
			puts "Not a proper symbol"
		end
				
	end
end

# point=Point.new("B3","X")
# puts point.weight