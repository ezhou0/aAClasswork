require_relative 'piece.rb'
require_relative 'stepable.rb'


class King < Piece
    include Stepable
    def symbol
        '♚'.colorize(color)
    end

    def move_diffs
    [
        [-1,-1],
        [-1,0],
        [0,-1],
        [0,1],
        [1,0],
        [1,1],
        [-1,1],
        [1,-1]
    ]
    end
end
