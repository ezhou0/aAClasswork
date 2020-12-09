class Piece
    attr_reader :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @valid_moves = []
    end

    def to_s
        "#{symbol}"
        return false
    end

    def empty?
    end

    def valid_moves
        
    end

    def pos=(val)
    end

    def symbol
    end

    private
    def move_into_check(end_pos)
    end
end