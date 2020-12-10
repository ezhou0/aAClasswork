require_relative 'piece.rb'
require_relative 'stepable.rb'

class Knight < Piece
    include Stepable

  def symbol
    "♞".colorize(color)
  end

  def move_diffs
   [
       [-2,-1],
       [-2,1],
       [-1,-2],
       [-1,2],
       [1,-2],
       [1,2],
       [2,-1],
       [2,1]
    ]
  end
  
end
