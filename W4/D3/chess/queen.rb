require_relative "piece.rb"
require_relative "slideable.rb"

class Queen < Piece
    include Slideable

    def symbol 
        "Q"
    end

    def move_dirs
        axial = true
        diagonal = true
        return [axial, diagonal] 
    end
end