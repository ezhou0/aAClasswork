/**
 * Initializes the Piece with its color.
 */
function Piece (color)//black or white
 {
    // let darkPiece.color = "black" ;
    // let lightPiece.color = "white";

    this.color = color 
}


/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
    if (this.color === "white"){
       //return "black";
       this.color = "black";
    }
    else{
        //return "white";
        this.color = "white";
    }
    return this.color;

};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    if (this.color === "white") {
        //return "black";
        this.color = "black";
    }
    else {
        //return "white";
        this.color = "white";
    }
    return this.color;
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {

    if(this.color === "white"){
        return "W";
    }else{
        return "B";
    }
};

// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
    module.exports = Piece;
}
// DON'T TOUCH THIS CODE