
class Board {
    constructor () {
        this.grid = Array.from(Array(3), () => Array(3));
    }

    won() {
        axial = [
                 [[-1,-1],[-1,0],[-1,1]],
                 [[0, -1],[0, 0],[0, 1]],
                 [[1, -1],[1, 0],[1, 1]],
                 [[-1,-1],[0,-1],[1,-1]],
                 [[-1, 0],[0, 0],[1, 0]],
                 [[-1, 1],[0, 1],[1, 1]]
        ]
        diagonal = [
                    [[-1,-1],[0,0],[1, 1]],
                    [[-1, 1],[0,0],[1,-1]]
        ]
        
    }

    winner () {

    }

    isEmpty (pos) {
        if(!this.isValidPos(pos)){
            throw new Error("This position is out of bounds.")
        }
        return (this.grid[pos[0], pos[1]] === null);
    }

    isValidPos(pos) {
        return (0 < pos[0] && pos[0] < 3 && 0 < pos[1] && pos[1] < 3);
    }

    place_mark (pos, mark) {
        if(!this.isEmpty(pos)) {
            throw new Error("This position is occupied.")
        }
    }

}