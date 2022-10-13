require "./board.rb"

class HumanPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        position = nil
        until legal_positions.include?(position)
            puts "enter a position with coordinates separated with a space like `4 7`"
            position = gets.chomp.split(" ").map {|pos| pos.to_i}
            if !legal_positions.include?(position)
                puts "#{position} is not a legal position"
            end
            if position.length != 2
                raise "sorry, you entered wrong values"
            end
        end
        position
    end
end