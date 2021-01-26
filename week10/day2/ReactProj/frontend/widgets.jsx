import React from 'react';
import ReactDOM from 'react-dom';
import Root from './root.jsx';


window.addEventListener("DOMContentLoaded", function(){
    const main = document.querySelector("#react-root");
    ReactDOM.render(<Root />, main);
});