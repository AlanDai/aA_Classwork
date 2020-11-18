const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");


const DEFAULTS = {
  COLOR: "purple",
  RADIUS: 25,
  SPEED: 4
};

function Asteroid (options) {
    options = options || {};
    options.color = DEFAULTS.COLOR;
    options.pos = options.pos || options.game.randomPosition();
    options.radius = DEFAULTS.RADIUS;
    options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);
    

    MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.remove = function remove(otherObject) {
  if(otherObject instanceof Ship) {
    otherObject.relocate();
  }
};


module.exports = Asteroid;