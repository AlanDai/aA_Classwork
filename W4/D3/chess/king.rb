require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece
    include Stepable
    # @color, @board, @pos

    def symbol
        "K"
    end

    protected
    def move_diff
        modifier = [[-1,-1], [-1,0], [-1,1],
                    [0,-1],          [0,1],
                    [1,-1],  [1,0],  [1,1]]
    end
end