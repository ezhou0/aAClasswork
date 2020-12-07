require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    possible_moves = node.children
    possible_moves.each do |child|
      if child.winning_node?(mark)
        node = child
        return node.prev_move_pos if node
      end
    end
    possible_moves.each do |child|
      if !child.losing_node?(mark)
        node = child
        return node.prev_move_pos if node
      end
    end
    raise_error


  end



end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
