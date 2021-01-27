import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/game';


document.addEventListener("DOMContentLoaded", ()=>{
    const rootReact = document.getElementById('root');
    ReactDOM.render(
        <Game />,
        rootReact
    );
});
