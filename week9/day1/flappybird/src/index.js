import FlappyBird from './game';
// import Game from './game'; 

const canvas = document.getElementById('bird-game');
new FlappyBird(canvas).restart();



// Finally, it's time to see some color on that canvas! You need to do a few final things to make this happen:
// import Game into index.js
// find the canvas using getElementById
// create a new instance of Game using the canvas you found
// call restart to trigger the first render
// do all this after the DOM has loaded