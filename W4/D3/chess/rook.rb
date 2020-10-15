require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece
    include Slideable

    def symbol 
        "r"
    end

    def move_dirs
        axial = true
        diagonal = false 
        return [axial, diagonal] 
    end
end