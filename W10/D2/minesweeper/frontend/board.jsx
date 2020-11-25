import React from 'react';
import * as Minesweeper from "./minesweeper_lib";
import Tile from './tile';

export default class Board extends React.Component {
  
  constructor(props){
      super(props);
  }

  render () {
    const { board, updateGame } = this.props;
    
    const tileRows = board.grid.map((row, rowIdx) => {
    
        const tileRow = row.map((curTile, colIdx) => (
            <Tile tile={curTile} updateGame={updateGame} key={rowIdx, colIdx}/>
        ))
        return(
            <div className="tile-row" row={rowIdx}>
                {tileRow}  
            </div>
        )
    
    })

    return (
        <div className="board">
            {tileRows}
        </div>
    );
  }
}