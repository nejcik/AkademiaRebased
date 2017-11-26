class Point
	attr_accessor :original_value, :x, :y, :symbol

	

	def initialize(value,players_symbol)
		@original_value=value
		@symbol = players_symbol
		set_proper_value(original_value)
	end

	def set_proper_value(original)
		# implement changing from "A1" to  (1,1)
		val_x =original[0].ord-64
		val_y = original[1].to_i

		@x=change_to_point(val_x)
		@y=change_to_point(val_y)
	end

	def change_to_point(previous_value)
		point_of_vector=2*previous_value-1
	end
end

