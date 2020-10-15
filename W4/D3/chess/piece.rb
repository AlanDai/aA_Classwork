class Piece
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s 
        print "color;#{color}, position;#{pos}"
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves 
        moves.select { |move| board.valid_pos?(move) && 
                        (board[move].is_a?(NullPiece) || board[move].color != color ) }
    end

    def symbol 
        raise "piece does not have a symbol"
    end

    

end