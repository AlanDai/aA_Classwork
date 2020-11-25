import React from 'react';
import * as Minesweeper from "./minesweeper_lib";
import Board from './board';

export default class Game extends React.Component {
    constructor(props) {
        super(props)
        
        const board = new Minesweeper.Board(10, 10);
        this.state = { board }
    }

    restartGame() {
        const board = new Minesweeper.Board(10, 10);
        this.setState({ board })
    }

    updateGame(tile, isFlagging) {
        if(isFlagging) {
            tile.toggleFlag();
        } else if(!tile.explored) {
            tile.explore();
        }
        const board = this.state.board;
        this.setState({ board })
    }

    render () {
        const { board } = this.state;
        
        let modal;
        if (board.lost() || board.won()) {
            const msg = board.won() ? "You win hot stuff" : "You suck loser";
            modal =
                <div className="modal-screen">
                    <div className="modal-content">
                        <p>{msg}</p>
                        <button onClick={() => this.restartGame()}>Restart Game</button>
                    </div>
                </div>
        }

        return (
            <div>
                {modal}
                <Board board={board} updateGame={(tile, flagging) => this.updateGame(tile, flagging)}/>
                <br/>
            </div>
        );
    }
}