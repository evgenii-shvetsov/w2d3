class ComputerPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        puts "enter a position with coordinates separated with a space like `4 7`"
        position = gets.chomp.split(" ").map {|pos| pos.to_i}
        if position.length != 2
            raise "sorry, you entered wrong values"
        end
        position
    end
end