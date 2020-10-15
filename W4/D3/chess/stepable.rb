module Stepable 
    def moves 
        row, col = pos
        move_diff.map {|step| [row + step[0], col + step[1]]}
    end

    private
    def move_diff
        raise "no move_diff method"
    end
end