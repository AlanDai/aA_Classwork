require_relative "piece.rb"

class Pawn < Piece

    def symbol
        'p'
    end

    def moves
        forward_steps + side_attacks
    end

    private
    def at_start_row?
        (pos[0] == 1 && color == :black) || (pos[0] == 6 && color == :white)
    end

    def forward_dir 
        color == :black ? (return 1) : (return -1)
    end

    def forward_steps
        steps = [[pos[0] + forward_dir, pos[1]]]
        steps << [pos[0] + 2 * forward_dir, pos[1]] if at_start_row?
        steps
    end

    def side_attacks
        attacks = []
        attack1 = [pos[0] + forward_dir, pos[1] + 1]
        attacks << attack1 unless board[attack1].is_a?(NullPiece)  
        attack2 = [pos[0] + forward_dir, pos[1] - 1]
        attacks << attack2 unless board[attack2].is_a?(NullPiece) 
        attacks 
    end
end

# ♜♞♝♛♚♝♞♜♟♖♘♗♕♔♗♘♖♙