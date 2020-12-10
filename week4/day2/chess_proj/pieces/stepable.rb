module Stepable

  def moves
    moves = []
    move_diffs.each do |subarr| #moves diffs is a 2D array, where each array is a positional movement
    #iterate thru this,
    #take each subarr position and add it to our current position to get to a move
    #unless this isnt a valid move, we have to store this position somewhere
      cur_x, cur_y = pos
      pos = [subarr[0]+cur_x, subarr[1]+cur_y]
      
      if board.valid_moves?(pos) && board.empty?(pos)
        moves << pos
      elsif board.valid_moves?(pos) && board[pos].color != color
        moves << pos
        #we need to implement empty/takepiece
      end
    end
    moves
  end

  
  private
  def move_diffs
    raise "error-not implemented"
  end
end