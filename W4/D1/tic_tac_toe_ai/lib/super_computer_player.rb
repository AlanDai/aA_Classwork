require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)

    not_losing_child = nil
    TicTacToeNode.new(game.board, mark).children.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
      not_losing_child = child.prev_move_pos unless child.losing_node?(mark)
    end

    # TicTacToeNode.new(game.board, mark).children.each do |child|
    #   return child.prev_move_pos unless child.losing_node?(mark)
    # end

    raise "No non-losing nodes" unless not_losing_child
    not_losing_child
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
