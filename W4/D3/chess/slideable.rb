module Slideable

    DIAG_DIRS = [[-1,-1], [-1,1], [1,-1], [1,1]]
    AXIAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]

    def moves
        axial, diagonal = moves_dirs
        pot_moves = []

        pot_moves += axial_dirs if axial
        pot_moves += diagonal_dirs if diagonal
        return pot_moves
    end

    def axial_dirs
        axial_moves = []
        AXIAL_DIRS.each do |dir|
            axial_moves += grow_unblocked_moves_in_dir(dir)
        end
        axial_moves
    end

    def diagonal_dirs
        diag_moves = []
        DIAG_DIRS.each do |dir|
            diag_moves += grow_unblocked_moves_in_dir(dir)
        end
        diag_moves
    end

    private
    def move_dirs
        raise "no move_dirs method"
    end

    def grow_unblocked_moves_in_dir(dir)
        dx, dy = dir
        new_moves = []

        current_pos = [current_pos[0] + dx, current_pos[1] + dy]
        while board.valid_pos?(current_pos) 
            new_moves << current_pos
            break unless board[current_pos].is_a?(NullPiece)
            current_pos = [current_pos[0] + dx, current_pos[1] + dy]
        end
        new_moves 
    end

end