const Util = require("./utils.js")

function MovingObject (options) {// pos, vel, radius, color) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {

    ctx.beginPath();
    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI,
        false
    );
    ctx.fillStyle = this.color;
    ctx.fill();
}

MovingObject.prototype.move = function() {

    [dx, dy] = this.vel;
    [x, y] = this.pos;
    // debugger
    this.pos = this.game.warp([x + dx, y + dy]);
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
    if(Util.distance(this.pos, otherObject.pos) < (this.radius + otherObject.radius)){
        return true;
    } else {
        return false;
    }

}

MovingObject.prototype.collideWith = function(otherObject){
    // this.game.remove(otherObject);
    // this.game.remove(this);
}

module.exports = MovingObject;