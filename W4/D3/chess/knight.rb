require_relative "piece.rb"
require_relative "stepable.rb"

class Knight < Piece
    include Stepable
    # @color, @board, @pos

    def symbol
        "k"
    end

    protected
    def move_diff
        modifier =  [       [-2,-1], [-2,1],
                    [-1,-2],                [-1,2],
                    [1,-2],                 [1,2],
                            [2,-1], [2,1]]
    end
end