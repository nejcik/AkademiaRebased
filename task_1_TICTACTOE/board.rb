require_relative 'point'

class Board
	attr_accessor :points_weights,  :game_board,  :max_size

	def initialize(size = 3)
		@points_weights = Array.new(size){ Array.new(size, 0) }
		create_game_board
		@max_size = size
	end

	def create_game_board(size=3)
 		size = 2 * size + 1
 		game_board_init = Array.new(size){ Array.new(size, 0) }

 		game_board_init.each_index do |i|
 			game_board_init[i].each_index do |j|
 				if i % 2 == 0 || i == 0
  					game_board_init[i][j] = "-"
 				elsif j%2 == 0 || j == 0
  					game_board_init[i][j] = "|"
 					else
  					game_board_init[i][j] = " "
 				end
 			end
 		end
 	

		num=1
		game_board_init.each_index do |i|
			if i%2 != 0 
				game_board_init[i].unshift(num)
				num += 1
			else
				game_board_init[i].unshift(" ")	
			end
		end

		letters=create_array_with_letters(game_board_init[1].length)
		game_board_init.unshift(letters)

		game_board_init.each_index do |i|
			game_board_init[i].push("\n")
		end


		@game_board = game_board_init
	end

	def create_array_with_letters(len)
		a_ascii = 65
		
		
		alphabet_row = Array.new(len) 
		alphabet_row.each_index do |i|
			if i%2 == 0 && i! = 0  
				alphabet_row[i] = a_ascii.chr
				a_ascii += 1
			else
				alphabet_row[i] = " "
			end
		end
		
	end

	def add_point(point)
	
		
		@points_weights[point.x][point.y] = point.weight
		
		x_= point.extended_index(point.x)
		y_= point.extended_index(point.y)
		
		@game_board[x_][y_] = point.symbol
	end

	def is_win(max_size = 3)
		sum=0

		# find in rows

		points_weights.each_index do |i|
			points_weights[i].each_index do |j|
				sum += points_weights[i][j]	
			end 
			# puts "rows #{sum}" 
			if check_sum(sum, max_size)
				return true
			end
			sum=0
		end

		# find in columns


		for j in 0..max_size-1
			for i in 0..max_size-1
				sum += points_weights[i][j]
			end
			
			# puts "cols #{sum}"
			if check_sum(sum, max_size)
				return true
			end
			sum = 0
		end

		# find in [0][0] [1][1] [2][2]
		j = 0
		i = 0
		sum=points_weights[i][j]+points_weights[i+1][j+1]+points_weights[i+2][j+2]	
		# puts "diag1 #{sum}"
		if check_sum(sum, max_size)
			return true
		end
		sum = 0

		# find in  [0][2] [1][1] [2][0]
		j = max_size -1
		i = 0
		sum=points_weights[i][j] + points_weights[i+1][j-1] + points_weights[i+2][j-2]	
		# puts "diag2 #{sum}"	
		
		if check_sum(sum, max_size)
			
			return true
		end
		sum = 0

		return false
	end

	def check_sum(sum, max_size)
		if sum == max_size || sum == -max_size
				# puts "We have a winner!"
				win = true
				#tutaj "jump" do konczonej gry
		end

		win
	end

	def board_to_show

		board = game_board.flatten.join
		
	end
end

