import React from 'react';
import Tile from './tile';

class Board extends React.Component{
    constructor(props) {
        super(props);

    }

    renderRows() {
        const board = this.props.board;
        return (
            board.grid.map((row, index) => {
                return (<div className='row' key={index}>{this.renderTiles(row, index)}</div>)
            })
        )
    }

    renderTiles(row, index) {
        return (
            row.map((tile, idx2) => {
                return (<Tile 
                        key = {index * 100 + idx2}
                />);
            })
        )
    }

    render() {
        return(
            <div>
                {this.renderRows()}

            </div>
        );
    }
}

export default Board;