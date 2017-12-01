class Point 
	attr_accessor :original_value, :x, :y, :symbol, :weight


	def initialize(value,players_symbol=" ")
		@original_value=value
		@symbol = players_symbol.capitalize
		set_indexes(original_value)
		set_weight(symbol)
	end

	def set_indexes(original)
		# implement changing from "A1" to  (1,1)
		@x =original[0].ord-65
		@y = original[1].to_i-1
	end

	def set_extended_index(index)
		point_value=2*index+1
	end

	def set_weight(symbol=" ")
		if symbol =="X"
			@weight = 1
		elsif symbol == "O"
			@weight = -1
		else
			puts "Wrong symbol"
		end
				
	end
end
