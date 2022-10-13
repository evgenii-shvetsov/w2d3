class ComputerPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        comp_pick = legal_positions.sample
        puts "Computer position is #{comp_pick.to_s}"
        comp_pick
    end
end