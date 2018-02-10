
class Cells
  attr_accessor :curr_table, :next_table

  def initialize(size=10)
    @curr_table = Array.new(size) { Array.new(size) { |i| i = 0}}
    @next_table = Array.new(size) { Array.new(size) }
  end

  def start
    # in 5 random places creating "live" cell
    10.times do 
      i = rand(10)
      j = rand(10)

      @curr_table[i][j] = 1

    end
  end



end


