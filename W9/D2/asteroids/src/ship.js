const MovingObject = require("./moving_object.js")
const Util = require("./utils.js")

const DEFAULTS = {
    COLOR: "blue",
    RADIUS: 50,
};

function Ship(options) {
    options = options || {};
    options.color = DEFAULTS.COLOR;
    options.pos = options.pos || options.game.randomPosition();
    options.radius = DEFAULTS.RADIUS;
    options.vel = options.vel || [0, 0];
    

    MovingObject.call(this, options);
};

Ship.prototype.relocate = function() {
    this.pos = this.game.randomPosition();
    this.vel = [0, 0];
}

Util.inherits(Ship, MovingObject);

module.exports = Ship;




