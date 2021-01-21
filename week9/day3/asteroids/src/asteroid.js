const MovingObject = require("./moving_object");
const Defaults ={
    color: "gray",
    radius: 20,
    speed: 5
};
function Asteroid(options){
    options = options || {};
    options.color = Defaults.color;
    options.radius = Defaults.radius;
    options.pos = options.pos;
    options.vel = options.vel || Util.randomVec(Defaults.speed);
    MovingObject.call(this, options);
}
Util.inherits(Asteroid, MovingObject);