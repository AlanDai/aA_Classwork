// inherits

Function.prototype.inherits1 = function (Parent) {
    function Surrogate (){};
    Surrogate.prototype = Parent.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

Function.prototype.inherits2 = function (parent) {
    this.prototype = Object.create(parent.prototype);
    this.prototype.constructor = this;
}

// Examples:
function MovingObject (direction, position) {
    this.direction = direction;
    this.position = position;
}
MovingObject.prototype.fly = function (distance) {
    this.position += this.direction * distance;
    console.log(`${this.position}`);
};

function Ship (color) {
    this.color = color;
}
Ship.inherits(MovingObject);

function Asteroid (direction, position) {
    MovingObject.call(this, direction, position);
}
Asteroid.inherits(MovingObject);