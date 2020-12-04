#The Game should have instance variable for the Board and the previously-guessed position (if any). It should also have methods for managing the Board-Player interaction. You may want a play loop that runs until the game is over. Inside the loop, you should render the board, prompt the player for input, and get a guessed pos. Pass this pos to a make_guess method, where you will handle the actual memory/matching logic. Some tips on implementing this:

# If we're not already checking another Card, leave the card at guessed_pos face-up and update the previous_guess variable.
# If we are checking another card, we should compare the Card at guessed_pos with the one at previous_guess.
# If the cards match, we should leave them both face-up.
# Else, flip both cards face-down.
# In either case, reset previous_guess.
# It wouldn't be an interesting game if the player could see their previous moves. Run system("clear") before rendering the Board. This will hide any previous output from the player. sleep(n) will pause the program for n seconds. Use this method to (temporarily) show the player an incorrect guess before flipping the Cards face-down again.
require_relative "board.rb"
# require_relative "card.rb"
class Game
    def initialize(size=4)
        ##1st guess <store this guess
        #initialize an instance variable called prev gues to store the 1st guess
        @prev_guess = nil
        @board = Board.new(size)
        #@player = player
    end

    def take_guess #a string with coordinates
        puts "Enter you guess in 1,2 format: "
        input = gets.chomp
        input.split(",").map(&:to_i)
    end

    def play
        #keep calling print grid with guess until game_over
        while !game_over?
            system "clear"
            @board.print_grid
            already_guessed_1 = true
            while already_guessed_1
                input_1 = take_guess
                if @board[input_1].revealed
                    puts "you've already got that one right"
                else
                    already_guessed_1 = false
                    @board[input_1].reveal
                    @board.print_grid
                end
            end
            already_guessed_2 = true
            while already_guessed_2
                input_2 = take_guess
                if @board[input_2].revealed
                    puts "you've already got that one right"
                else
                    already_guessed_2 = false
                    @board[input_2].reveal
                    @board.print_grid
                end
            end
            #if theres a match, then we keep both revealed
            #else hide both guesses
            if @board[input_1] != @board[input_2]
                puts "they dont match"
                @board[input_1].hide
                @board[input_2].hide
            end
            sleep(3)
            puts "_________________________"
        end
    end

    def game_over?
        @board.won?
    end
end

game = Game.new
game.play
