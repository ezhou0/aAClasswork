import React from 'react';
import Board from './board.jsx';
import * as Minesweeper from '../minesweeper.js'; 

class Game extends React.Component{
    constructor(props){
        super(props);
        const board = new Minesweeper.Board(2, 0);
        this.state = {board: board};
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(){

    }

    render(){
        return(
            <div>
                <Board board={this.state.board} updateGame={this.updateGame}/>
            </div>
        );

    }
}
export default Game;