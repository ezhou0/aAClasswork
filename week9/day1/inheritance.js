// GOALS: Be able to write and explain Function.prototype.inherits
  // Know what a Surrogate class does and why we need it
  // Know what the constructor property does
  // Know what __proto__ is
  // Know what new does
  // Know what Object.create does
  // Know how to test an inheritance implementation

// Steps to implement class inheritance in Javascript using a Surrogate.
  // Define a Surrogate class
    // Set the prototype of the Surrogate(Surrogate.prototype = SuperClass.prototype)
    // Set Subclass.prototype = new Surrogate()
    // Set Subclass.prototype.constructor = Subclass

Function.prototype.inherits = function(ctx){
  function Surrogate(){}
  Surrogate.prototype = ctx.prototype;
  this.prototype = new Surrogate;
  this.prototype.constructor = this;
}
  
function MovingObject() { 
  this.speak = console.log('i move');  
}

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

// let asteroid1 = new Asteroid;
let movingObject = new MovingObject;
// console.log();
// console.log(asteroid1);
// asteroid1.speak;