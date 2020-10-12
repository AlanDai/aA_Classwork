require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    # for clarity
    our_mark = evaluator 
    opp_mark = ( evaluator == :x ? :o : :x )

    # base case
    if self.board.over?
      (self.board.winner == opp_mark) ? (return true) : (return false)
    end

    # rec case
    curr_children = self.children

    # Our turn
    if our_mark == next_mover_mark
      curr_children.all? do |child|
        child.losing_node?(our_mark)
      end
    else
      # Opponents turn
      curr_children.any? do |child|
        child.losing_node?(our_mark)
      end
    end

  end

  def winning_node?(evaluator)
    # for clarity
    our_mark = evaluator 
    
    # base case
    if self.board.over?
      (self.board.winner == our_mark) ? (return true) : (return false)
    end

    # rec case
    curr_children = self.children

    if our_mark == next_mover_mark
      curr_children.any? do |child|
        child.winning_node?(our_mark)
      end
    else
      curr_children.all? do |child|
        child.winning_node?(our_mark)
      end
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    positions = []

    (0...3).each do |row|
      (0...3).each do |col|
        pos = [row, col]
        positions << pos if @board.empty?(pos)
      end
    end

    positions.map do |pos|
      child_board = @board.dup
      child_board[pos] = next_mover_mark
      opp_mark = ( next_mover_mark == :x ? :o : :x )
      TicTacToeNode.new(child_board, opp_mark, pos)
    end
  end
end