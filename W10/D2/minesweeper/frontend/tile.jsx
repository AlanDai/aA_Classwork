import React from 'react';
import * as Minesweeper from './minesweeper_lib';

export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        let isFlagging = false;
        if (e.type === 'contextmenu'){
            e.preventDefault();
            isFlagging = true;
        }
        this.props.updateGame(this.props.tile, isFlagging);
    }

    render() {
        const { bombed, explored, flagged } = this.props.tile;
        const tile = this.props.tile;

        let tileText, classNames;
        if (explored) {
            if (bombed) {
                tileText = '\u2622';
                // tileText = "&#128163";
                classNames = "tile bombed explored";
                // alert("You Lost!")
            } else {
                const count = tile.adjacentBombCount()
                tileText = count > 0 ? `${count}` : "";
                classNames = "tile explored";
            }
        } else {
            if (flagged) {
                // tileText = '\u1f1f8';
                tileText = '\u2690' //"&#127987"
                classNames = "tile flagged unexplored";
            } else {
                classNames = "tile unexplored"
            }
        }
        
        return (
            <div>
                <div className={classNames} onClick={this.handleClick} onContextMenu={this.handleClick}>{tileText}</div>
            </div>
        );
    }

}