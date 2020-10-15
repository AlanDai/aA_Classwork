require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
    include Slideable

    def symbol 
        "b"
    end

    def move_dir
        axial = false
        diagonal = true 
        return [axial, diagonal] 
    end
end