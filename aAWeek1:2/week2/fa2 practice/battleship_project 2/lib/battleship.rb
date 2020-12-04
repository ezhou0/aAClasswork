require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(n) #n is length of board
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        puts "num ships: #{ @board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if board.num_ships == 0
            p "you win"
            return true
        else
            return false
        end
    end
    def game_over?
        self.win? || self.lose? 
    end
    def turn
        pos = @player.get_move
        if !@board.attack(pos)
            @remaining_misses -= 1
        end
        @board.print
        p "remaining misses: #{@remaining_misses}"

    end

end
