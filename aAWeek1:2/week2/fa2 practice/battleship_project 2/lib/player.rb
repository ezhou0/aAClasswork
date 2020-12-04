class Player
    def get_move
        p "enter a position with coordinates separated with a space like `4 7`"
        move = gets.chomp
        arr = move.split(" ").map(&:to_i)
        arr
    end
end
