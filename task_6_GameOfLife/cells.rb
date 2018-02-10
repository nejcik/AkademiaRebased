
class Cells
  attr_accessor :curr_table, :next_table, :size, :count_alive

  def initialize(size = 10)
    @curr_table = Array.new(size) { Array.new(size) { |i| i = 0}}
    @next_table = Array.new(size) { Array.new(size) }
    @size = size
    @count_alive = 0

    start(size)
  end

  def start(size)
    # in size random places creating "live" cell
    size.times do 
      i = rand(size)
      j = rand(size)

      @curr_table[i][j] = 1

    end
  end

  def check_neighbours
    curr_table.each_index do |i|
      curr_table.each_index do |j|
        if i == 0 && j == 0
          @count_alive += curr_table[i + 1][j + 1]
          @count_alive += curr_table[i + 1][j]
          @count_alive += curr_table[i][j + 1]

        elsif i == size && j == 0
          @count_alive += curr_table[i - 1][j]
          @count_alive += curr_table[i - 1][j + 1]
          @count_alive += curr_table[i][j + 1]
          
        elsif i == size && j == size
          @count_alive += curr_table[i][j - 1]
          @count_alive += curr_table[i - 1][j - 1]
          @count_alive += curr_table[i - 1][j]
          
        elsif i == 0 && j == size
          @count_alive += curr_table[i][j - 1]
          @count_alive += curr_table[i + 1][j - 1]
          @count_alive += curr_table[i + 1][j]
          
        elsif ((1...size-1).include? i) && j == 0
          @count_alive += curr_table[i - 1][j]
          @count_alive += curr_table[i - 1][j + 1]
          @count_alive += curr_table[i][j + 1]
          @count_alive += curr_table[i + 1][j + 1]
          @count_alive += curr_table[i + 1][j]
          
        elsif i == size && ((1...size-1).include? j) 
          @count_alive += curr_table[i][j + 1]
          @count_alive += curr_table[i - 1][j + 1]
          @count_alive += curr_table[i - 1][j]
          @count_alive += curr_table[i - 1][j - 1]
          @count_alive += curr_table[i][j - 1]
          
        elsif ((1...size-1).include? i) && j == size
          @count_alive += curr_table[i - 1][j]
          @count_alive += curr_table[i - 1][j - 1]
          @count_alive += curr_table[i][j - 1]
          @count_alive += curr_table[i + 1][j - 1]
          @count_alive += curr_table[i + 1][j]
          
        elsif i == 0 && ((1...size-1).include? j)
          @count_alive += curr_table[i][j - 1]
          @count_alive += curr_table[i + 1][j - 1]
          @count_alive += curr_table[i + 1][j]
          @count_alive += curr_table[i + 1][j + 1]
          @count_alive += curr_table[i][j + 1]
          
        elsif ((1...size-1).include? i) && ((1...size-1).include? j)
          @count_alive += curr_table[i][j - 1]
          @count_alive += curr_table[i + 1][j - 1]
          @count_alive += curr_table[i + 1][j]
          @count_alive += curr_table[i + 1][j + 1]
          @count_alive += curr_table[i][j + 1]
          @count_alive += curr_table[i - 1][j + 1]
          @count_alive += curr_table[i - 1][j]
          @count_alive += curr_table[i - 1][j - 1]
        end 

        get_next_cell_state(i,j,count_alive)
        @count_alive = 0
      end
    end
    @curr_table = next_table
  end

  def show_table
    curr_table.each { |x|
      puts x.join(" ")
    }
  end 

  def get_next_cell_state(x,y,count_alive)
    # print x, y
    if curr_table[x][y].eql? 1
      if count_alive == 2 || count_alive == 3
        @next_table[x][y] =  1
      else
        @next_table[x][y] =  0
      end
    else
      if count_alive == 3
        @next_table[x][y] =  1
      else
        @next_table[x][y] =  0
      end
    end
  end
end


