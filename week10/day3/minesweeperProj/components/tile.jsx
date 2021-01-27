import React from 'react';

class Tile extends React.Component{
    constructor(props){
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e){
        e.preventDefault();
        const flagged = e.altKey ? true : false;
        this.props.updateGame(this.props.tile, flagged);
    }

    render(){
            //if statements to determine what the tile is
            //Update your render logic to change the text of the 
            // tile based on whether it has been revealed, is bombed,
            //  or is flagged. If it's been revealed and has 
            //  more than one adjacent bomb, 
        //     // show that number. For bombs and flags, use Unicode!
        // export class Tile {
        //     constructor(board, pos) {
        //         this.board = board;
        //         this.pos = pos;
        //         this.bombed = false;
        //         this.explored = false;
        //         this.flagged = false;
        //     }
        const tile = this.props.tile;
        let text;
        let tileClass;
        if(tile.explored) {
            if(tile.bombed){
                tileClass = 'bombed';
                text = '\u1F4A3';
            }else{
                tileClass = 'explored';
                text = ' ${tile.adjacentBombCount()} ';
            }
        }
        else if(tile.flagged){
            tileClass = 'flagged';
            text = '\u2691';
        } 
        else{
            tileClass = 'unexplored';

        }
        return(
            <div className={tileClass} onClick = {this.handleClick}> 
                {text}
            </div>
        );
    }
}

export default Tile;