require "./human_player.rb"
require "./board.rb"
require "./computer_player.rb"

class Game
    def initialize(board_size, hash_players) #hash
        @players = []
        hash_players.each do |mark, computer_bool|
            if computer_bool
                @players << ComputerPlayer.new(mark)
            else
                @players << HumanPlayer.new(mark)
            end
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

            pick = @board.legal_positions

            @board.place_mark(@current_player.get_position(pick), @current_player.mark_value)
            
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