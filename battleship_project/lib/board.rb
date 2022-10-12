class Board

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    attr_reader :size
  def initialize(n)
    @n = n
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = @grid.length * @grid[0].length
  end

  def [](position)
    row,col = position
    @grid[row][col]
  end

  def []=(position, value)
    row,col = position
    @grid[row][col] = value
  end

  def num_ships
    count = 0
    @grid.each do |ele|
        ele.each {|sub| count += 1 if  sub == :S}
    end
    count
  end

  #PART 2

  def attack(position)
    # row,col = position
    if self[position] == :S
        self[position] = :H
        puts "you sunk my battleship"
        return true
    else
        self[position] = :X
        return false
    end
  end

  def place_random_ships
    limit_of_S = self.size * 0.25
    
    while self.num_ships < limit_of_S
        row = rand(0...@grid.length)
        col = rand(0...@grid.length)
        position = [row, col]
        self[position] = :S   
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
        row.map do |col|
            if col == :S
                :N
            else
                col
            end
        end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
