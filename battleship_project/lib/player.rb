class Player
    #PART 3
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        input = gets.chomp.split(" ")
        position = [input[0].to_i, input[1].to_i]
        position
    end
end
