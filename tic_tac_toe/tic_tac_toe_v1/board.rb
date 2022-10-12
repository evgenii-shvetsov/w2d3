class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(position)
        row,col = position
        if row >= 0 && row < 3 && col >= 0 && col < 3
            return true
        else
            return false
        end
    end

    def empty?(position)
        row,col = position
        if @grid[row][col] == :X
            return false
        elsif @grid[row][col] == :O
            return false
        else
            return true
        end
    end

    def place_mark(position, mark)
        row,col = position
        if !valid?(position)
            raise
        elsif !empty?(position)
            raise
        else
            @grid[row][col] = mark
        end
    end
    #Everything is correct so far

    def print
        @grid.each do |row|
            puts row.join("|")
        end
    end

    def win_row?(mark)
        @grid.any? {|row| row.all?(mark)}
    end

    def win_col?(mark)
        @grid.transpose.any? {|col| col.all?(mark)}
    end

    def win_diagonal?(mark)
        left_part = (0...@grid.length).all? do |i|
            @grid[i][i] == mark
        end

        right_part = (0...@grid.length).all? do |i|
            col = @grid.length - 1 - i
            @grid[i][col] == mark
        end

        left_part || right_part
        
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|ele| ele == "_"}
    end



end

#  game = Board.new

# # p game.valid?([0,1])
# # p game.empty?([0,1])
# p game.empty_positions?