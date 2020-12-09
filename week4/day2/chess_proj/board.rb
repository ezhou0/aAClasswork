require_relative 'pieces/piece.rb'

class Board
    attr_reader :grid
    def initialize
        starting_board
    end

    def[](pos)
        row,col = pos
        @grid[row][col]
    end

    def []=(pos, piece)
        row,col = pos
        @grid[row][col] = piece
    end

    def add_piece(pos, piece)
        if pos.empty?
            self[pos] = piece
        end
    end

    def add_pieces(color)
        pieces = ["R","Kn","B","Q","K","B","Kn","R"]
        # iterate through pieces
        # at line 0 & 7
        # for each piece, we want to create an instance of that piece at that position.
        color == "white" ? i = 7 : i = 0
        pieces.each_with_index do |piece, j|
            Piece.new(color, self, [i, j])
        end
    end

    def add_pawns(color)
        color == "white" ? i = 6 : i = 1
        (0..7).each do |j|
            Piece.new(color, self, [i, j])
        end
    end

    def starting_board
        @grid = Array.new(8) {Array.new(8, " ")}
        # ["white", "black"].each do |color|
        #     add_pieces(color)
        #     add_pawns(color)
        # end

        [0,1,6,7].each do |i|
            (0..7).each do |j|
                self[[i,j]] = Piece.new
            end
        end
        # iterate through color
        # for color, we want to call add_pieces or add_pawns to fill in spots
        # 
    end

    def validmove?(pos)
        #this piece has the ability to move like this
        #this is within bounds of the board
        if pos[0] >= 0 && pos[0] <= 7 && pos[1] >= 0 && pos[1] <= 7 
            return true
        end 
        false
        #if the space is not occupied by the same color
    end

    def move_piece(start_pos, end_pos)
        raise "there is no piece at start pos" if start_pos == " "
        raise "invalid move" if !validmove?(end_pos)

        piece = self[start_pos] #piece is in this starting pos
        #move this value to endpos
        #replace piece at startposition with " "
        self[end_pos] = piece
        self[start_pos] = " "
        
        #piece.position = end_pos

    end

end



#R K B q k B K R
#P P P P P P P P
#' ' ' ' ' ' ' '
#' ' ' ' ' ' ' '
#' ' ' ' ' ' ' '
#' ' ' ' ' ' ' '
#' ' ' ' ' ' ' '
#P P P P P P P P
#R K B Q K B K R

board = Board.new
# p board

board.move_piece([5,5], [0,0])
p board
