# # The Board is responsible for keeping track of all your Cards. 
# You'll want a grid instance variable to contain Cards. Useful methods:

# # #populate should fill the board with a set of shuffled Card pairs
# # #render should print out a representation of the Board's current state
# # #won? should return true if all cards have been revealed.
# # #reveal should reveal a Card at guessed_pos (unless it's already face-up, 
# in which case the method should do nothing). It should also return the value of the card it revealed (you'll see why later).
# # Parallel Assignment
# # In Ruby you can declare and assign multiple variables at once using commas to separate multiple variables and values. For example,

# # x, y, z = 1, 2, 3 # x = 1, y = 2, z = 3
# # And if there's not the same number of variables and values?

# # x, y = 1, 2, 3 # x = 1, y = 2, 3 is not assigned
# # a, b, c = 10, 20 # a = 10, b = 20, c = nil
# # When there are multiple variables assigned to an array, Ruby expands 
# the array so that each element becomes its own value! For example,

# # x, y, z = [1, 2, 3] # x = 1, y = 2, z = 3
# # a, b, c = [10, 20] # a = 10, b = 20, c = nil
# # This is very helpful to use when writing [](pos) and 
# []=(pos, value) for your Board to access row and col. Because the pos exists 
# as an array, it's better to pass it as an array in a method call, 
# relying on the method to index the array.

require_relative "card.rb"

class Board
    attr_accessor :size
    attr_reader :grid
    def initialize(size = 4)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
        populate
    end

    #some helper functions for position [](pos) //[]=(pos,value) to access//
    def [](pos)
        row, col = pos
        @grid[row][col]
    end
    def []=(pos,value)
        row, col = pos
        @grid[row][col] = value
    end

     #have a method that populates the grid with cards
    def populate
        num_pairs = (@size**2) / 2
        cards = Card.pairvalues(num_pairs) ##array of card values, in pairs, randomized
        
         ## Card.randompairs(numpairs) <this returns an arr of values to assign to card positions in the grid
        ## iterate thru the grid and assign each index value of the randomarray to a position
        
        @grid.each_index do |x|
            @grid[x].each_index do |y|
                self[[x,y]] = cards.pop #populate grid
            end
        end
    end
    #print grid when game is either won or lost maybe
    def print_grid
        (0...@grid.length).each do |row|
            row_s = ""
            (0...@grid.length).each do |col|
                if @grid[row][col].revealed == true
                    if col != @grid.length - 1 #if @grid[blah].reveal == true
                        row_s += @grid[row][col].value + " . "
                    else
                        row_s += @grid[row][col].value
                    end
                else
                    if col != @grid.length - 1 #if @grid[blah].reveal == true
                        row_s += "_ . "
                    else
                        row_s += "_"
                    end
                end
            end
            puts row_s
        end
    end


    # def revealcard(pos)
    #     self[pos].reveal
    # end
    # _.3._._
    # _._._._
    # _._.3._
    # _._._._

    #guess_1 and if guess_2 == guess_1 then display
    #display card(s): either display a card or display another card after one card is already displayed.size
    #when cards match, we must leave them displayed

    #we can iterate through print grid and only print matches and guesses. 

    #some method that prints board
    def won? 
        @grid.all? do |row|
            row.all? do |ele|
                #ele.revealed == true
            end
        end
    end


end

# board = Board.new
# board.populate
# board.print_grid
