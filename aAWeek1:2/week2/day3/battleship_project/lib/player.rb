class Player
    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        pos = gets.chomp
        [pos[0].to_i,pos[-1].to_i]

        #pos = gets.chomp.split.map {|el| el.to_i}
    end
end
