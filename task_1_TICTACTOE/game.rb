require_relative 'board'
require_relative 'point'
require_relative 'player'

class Game
	attr_accessor :players, :player_idx, :cells, :num_iterations

	def initialize
		puts "*"*40
		puts "KÓŁKO I KRZYŻYK"
		puts "*"*40
	end

	def start_game
		create_players
		game_rules
		create_board
		@player_idx=0
		puts "Zaczyna pierwszy gracz: #{players[player_idx].name}"
		play
	end

	def game_rules
		puts " "
		puts "*"*40
		puts "Zadady indeksowania pól: podajemy literami i cyframi, tj. A1, B2 itd."
		puts "*"*40
		puts " "
	end

	def create_board
		@cells=Board.new
		show_board(cells.board_to_show)
		set_num_iterations(cells.max_size)
	end

	def set_num_iterations(cell_size)
		@num_iterations=(cell_size)**2
	end

	def show_board(board)
		print board
	end

	def create_players
		puts "Do gry potrzeba Graczy!"

		player_A=0
		puts "GRACZU 1: Jak masz na imię?"
		name=gets
		name.delete!("\n")

		until player_A == 1 do
			puts "Cześć #{name}, jakie symbol wybierasz? Kółko (O) czy krzyżyk (X)?"
			symbol_pA=gets
			print 
			symbol_pA.upcase!
			
			player_A=check_symbol(symbol_pA)
			symbol_pA.delete!("\n")
		end
		playerA=Player.new(name,symbol_pA)

		puts " "
		puts "GRACZU 2: Jak masz na imię?"
		name2=gets
		name2.delete!("\n")
		symbol2=which_symbol(symbol_pA)
		playerB=Player.new(name2,symbol2)

		@players=[playerA,playerB]
	end


	def which_symbol(symbol)
		if symbol=="X"
			puts "Ponieważ gracz nr 1 wybrał krzyżyk, Twoim symbolem jest kółko"
			return "O"
		else

			puts "Ponieważ gracz nr 1 wybrał kółko, Twoim symbolem jest krzyżyk"
			return "X"
		end
	end

	def check_symbol(symbol)
		if symbol=="X\n" or symbol == "O\n"
			puts "Ok... Już Cię tworzymy..."
			return 1
		else
			puts "Nieładnie tak wybierać coś innego! Od nowa! Kółko lub Krzyżyk!"
			return 0
		end
	end

	def play
		
		i=0
		until i >= num_iterations do
			p_num=0
			puts "You go, #{players[player_idx].name}"

			until p_num == 2 do
				
				puts "Podaj miejsce do wstawienia kółka/krzyżyka: "
				point=gets
				point.delete!("\n")				

				# (1) sprawdzenieczy w ogole dobrze wpisane 
				p_num=check_point_input(point)
				
				
				# (3) Sprawdzenie czy juz istnieje
				# (2) Sprawdzenie czy nie wychodzi poza tablicę
		
				if not point==""
					player_point=Point.new(point,players[player_idx].symbol)
					p_num=check_point(player_point)
				end
		
			end

			cells.add_point(player_point)
			show_board(cells.board_to_show)

			if cells.is_win
				puts " "
				puts "We have a winner!  #{players[player_idx].name}"
				puts " "
				i=20
			elsif i==num_iterations-1
				i+=1
			else
				puts " "
				puts "Gramy dalej!"
				puts " "

				change_player
				i+=1
			end

		end

		if i==num_iterations
			puts "Nie ma wygranej!"
			new_game
		elsif i==20
			puts "Gracz: #{players[player_idx].name} wygrał!"
			# puts "YAY"
			# players[player_idx].number_of_winnings+=1
			# puts "Gracz: #{players[player_idx].name} ma: #{players[player_idx].number_of_winnings} wygraną/ych"
			# new_game
		end
	end

	def change_player
		if player_idx == 0
			@player_idx = 1
		else
			@player_idx = 0
		end
	end

	def check_point_input(point_input)
		# if properly set
		len=point_input.length
		if len==0
			puts "Musisz wpisać cokolwiek!"
			return 0
		elsif !(65..90).member?(point_input[0].ord)
			puts "Zaczynamy zawsze od litery (dużej): A,B,C... itd."
			return 0
		elsif len>2
			puts "Maksymalne cyfry to od 1 do 9"
			return 0
				
		else
			return 1
		end
	end

	def check_point(p_val)

		if p_val.x >= cells.points_weights.length or p_val.y>=cells.points_weights.length 
			puts "Złe miejsce wprowadzonego punktu! spróbuj jeszcze raz!"
			return 1
		elsif not cells.points_weights[p_val.x][p_val.y]==0 
			puts "Złe miejsce wprowadzonego punktu! spróbuj jeszcze raz!"
			return 1
		else
			return 2
		end
	end

	# In cale playing multiple times:
	def new_game
		y_n=0
		until y_n ==1 do
			puts "Nowa partyjka? [Y/N]:"
			ans=gets
			ans.delete!("\n")
			if ans =="Y"
				y_n=1
				puts "="*30
				puts "NOWA ROZGRYWKA"
				puts "="*30
				create_board
				play
			else
				y_n=1
				puts "Okey, koniec gry!"
				puts "Ostateczny wynik:"
				puts "Gracz #{players[0].name}: #{players[0].number_of_winnings}"
				puts "Gracz #{players[1].name}: #{players[1].number_of_winnings}"
			end
		end
	end	

end



# START GAME

game=Game.new
game.start_game
