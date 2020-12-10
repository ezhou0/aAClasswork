class Piece
    attr_reader :board, :pos, :color
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @valid_moves = []

        board.add_piece(pos, self)
    end

    def to_s
        " #{symbol} "
    end

    def empty?
        false
    end

    def valid_moves
        moves.reject { |move| move_into_check?(move) }
    end

    def pos=(val)
    end

    def symbol
    end

    private

    # You will want a method on Piece that filters out the #moves of a Piece that would leave the player in check. A good approach is to write a Piece#move_into_check?(end_pos) method that will:
    # Duplicate the Board and perform the move
    # Look to see if the player is in check after the move (Board#in_check?)
    def move_into_check?(end_pos)
        dup = board.dup
        dup.move_piece(pos, end_pos)
        dup.in_check?(color)
    end
end