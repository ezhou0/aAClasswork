require_relative 'board'
require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    system("clear")
    #call a method that creates a board
    #maybe we dont want it in a 2d array, but joined by " "
    create_board.each do |row|
      puts row.join("")
    end
  end

  def colorcode(i,j)
    if cursor.cursor_pos == [i,j] && cursor.selected == true
      background = :yellow
    elsif cursor.cursor_pos == [i,j]
      background = :blue
    elsif (i+j).odd?
      background = :red
    else
      background = :green
    end
    {background: background}
  end

  def create_board
    @board.grid.map.with_index do |row, i|
      row.map.with_index do |piece, j|
        piece.to_s.colorize(colorcode(i,j))
        
      end
    end
  end

  #[
    #[       ]
    #[       ]
    #[       ]
    #[       ]
  #]

  def looper
    loop do
    render
    cursor.get_input 
    end
  end


end
board = Board.new
display = Display.new(board)
display.looper

#every other square an alternating color
#cursor should be a 3rd color
#fix black/white piece

####[0,0] [0,1] [0,2] [0,3]red blue red blue
### [1,0] [1,1] [1,2] [1,3] blue red blue red
###
