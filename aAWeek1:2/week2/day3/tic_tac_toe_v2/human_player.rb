class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        p "enter a position"
        pos = gets.chomp.split(" ").map {|el| el.to_i}
        raise "invalid position" if pos.length != 2 
        pos
    end
end