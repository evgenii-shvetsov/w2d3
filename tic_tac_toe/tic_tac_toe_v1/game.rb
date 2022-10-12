require "./human_player.rb"
require "./board.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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