const MovingObject = require("./moving_object.js");

document.addEventListener("DOMContentLoaded", function () {
    const canvasEl = document.getElementsByTagName("canvas")[0];
    const ctx = canvasEl.getContext("2d");


    window.MovingObject = MovingObject;
    const mo = new MovingObject({
        pos: [30, 30],
        vel: [10, 10],
        radius: 5,
        color: "#00FF00"
    });
    mo.draw(mo.color);
    window.Asteroid = Asteroid;
    const ast = new Asteroid({
        pos: [35, 35] 
    })

});
