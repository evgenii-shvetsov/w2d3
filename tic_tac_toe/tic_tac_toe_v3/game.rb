require "./human_player.rb"
require "./board.rb"

class Game
    def initialize(board_size, *players_marks)
        @players = []
        players_marks.each do |player|
            @players << HumanPlayer.new(player)
        end
        @current_player = @players[0]
        @board = Board.new(board_size)
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark_value)
            
            if @board.win?(@current_player.mark_value)
                puts "#{@current_player.mark_value.to_s} won the game"
                return
            else 
                switch_turn
            end
        end

        puts "Game Over"
        puts "DRAW"
    end
end