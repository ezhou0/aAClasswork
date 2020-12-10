module Slideable
    HORIZONTAL_DIRS = [[-1,0],[0,-1], [1,0] , [0,1]]

    DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,-1],[1,1]]

    def horizontal_direction
        HORIZONTAL_DIR
    end

    def diagonal_direction
        DIAGONAL_DIRS
    end

    def hor_and_diag_direction
        HORIZONTAL_DIR+DIAGONAL_DIRS
    end

    def moves
        moves = []
        move_dirs.each do |x, y|
            moves += grow_unblocked_moves_in_dir(x, y)
        end
        moves
        #stores moves in an array
        #iteratues thru all possible piece specific moves
        #selects those moves from unblocked moves
    end

    private
    def moves_dirs
        raise "Error - not implemented"
        #this is implemented by the specific piece, telling us what it can and cannot do
    end
    
    def grow_unblocked_moves_in_dir(dx,dy)
        #store moves we can go to from our current pos
        #we jsut want to store all possible moves in all directions
        cur_x = pos[0]
        cur_y = pos[1]
        moves = []

        loop do
            cur_x = cur_x + dx
            cur_y = cur_y + dy
            position = [cur_x, cur_y]

            break unless board.valid_move?(position) 
            
            if board.empty?(position)
               moves << position
            elsif board[pos].color != color
                moves << position
            end
            # implement case if position is empty or is occupied(same color?)

        end
        return moves
        #a loop here
        #iterate and keep adding dx dy to pos and keep updating curx,y, 
        #shoveling them into moves every iteration
        #iteration ends when theres no longer a valid position to go to
        #loop
        #break if the new pos isnt valid or smth
        #end

        #return moves

        ##XNX#
        #NNRNN
        ##XNX#
    end

end


###
###
#N# [2,1]
#P# [3,1] HORIZONTAL_DIR -> [-1,0]