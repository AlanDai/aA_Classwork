require_relative "piece.rb"

class Board

    def self.populate_board(chess_board)
        new_arr = []
        [0, 1, 6, 7].each do |i|
            chess_board[i].map! {|ele| Piece.new}
        end
    end

    def initialize
        @chess_board = Array.new(8) {Array.new(8, nil)}
        Board.populate_board(@chess_board)
    end

    def inspect 
        p @chess_board
    end

    def [](pos)
        row, col = pos
        @chess_board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @chess_board[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "Start position is out of bounds" if start_pos[0] < 0 || start_pos[0] > 7 ||
                                                   start_pos[1] < 0 || start_pos[1] > 7
        raise "End position is out of bounds" if end_pos[0] < 0 || end_pos[0] > 7 ||
                                                 end_pos[1] < 0 || end_pos[1] > 7

        raise "There is no piece at the given start position" if self[start_pos].nil?
        
        self[start_pos], self[end_pos] = nil, self[start_pos]
    end
end