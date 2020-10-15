require_relative "knight.rb"
require_relative "king.rb"
require_relative "rook.rb"
require_relative "queen.rb"
require_relative "bishop.rb"
require_relative "pawn.rb"
require_relative "null_piece.rb"

class Board

    attr_reader :chess_board

    def initialize
        @chess_board = Array.new(8) {Array.new(8, NullPiece.instance)}
        populate_board
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
        raise "Start position is out of bounds" unless valid_pos?(start_pos)
        raise "End position is out of bounds" unless valid_pos?(end_pos)

        raise "There is no piece at the given start position" if self[start_pos].is_a?(NullPiece)

        raise "#{self[start_pos].class} can't move there" unless self[start_pos].valid_moves.include?(end_pos)
        
        self[start_pos].pos = end_pos
        self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
    end

    def valid_pos?(pos)
        pos[0] >= 0 && pos[0] < 8 && pos[1] >= 0 && pos[1] < 8
    end

    def add_piece(piece)
        self[piece.pos] = piece
    end

    private
    def populate_board

        [0,7].each do |col|
            add_piece(Rook.new(:black, self, [0, col]))
            add_piece(Rook.new(:white, self, [7, col]))
        end

        [1,6].each do |col|
            add_piece(Knight.new(:black, self, [0, col]))
            add_piece(Knight.new(:white, self, [7, col]))
        end
        
        [2,5].each do |col|
            add_piece(Bishop.new(:black, self, [0, col]))
            add_piece(Bishop.new(:white, self, [7, col]))
        end

        add_piece(Queen.new(:black, self, [0,3]))
        add_piece(Queen.new(:white, self, [7,3]))
        add_piece(King.new(:black, self, [0,4]))
        add_piece(King.new(:white, self, [7,4]))
 
       # pawnline
        (0...8).each do |col| 
            add_piece(Pawn.new(:white, self, [6, col]))
            add_piece(Pawn.new(:black, self, [1, col]))
        end

    end
end