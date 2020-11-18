const Asteroid = require("./asteroid.js")
const Util = require("./utils.js")
const Ship = require("./ship.js")

function Game() {
    this.asteroids = this.addAsteroids();
    this.ship = new Ship({game: this});
}

Game.DIM_X = 500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 30;

Game.prototype.addAsteroids = function() {
    let asteroids = [];
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
        asteroids.push(new Asteroid({pos: this.randomPosition(), game: this}));

    }
    return asteroids;
}

Game.prototype.randomPosition = function() {
    let x = Math.random() * Game.DIM_X;
    let y = Math.random() * Game.DIM_Y;
    return [x, y];
}

Game.prototype.draw = function(context) {
    context.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
    for (let i = 0; i < this.allObjects().length; i++) {
        this.allObjects()[i].draw(context);
    }
}

Game.prototype.moveObjects = function(){
    for (let i = 0; i < this.allObjects().length; i++) {
      this.allObjects()[i].move();
    }
}

Game.prototype.warp = function(pos){
    return [Util.wrap(pos[0], Game.DIM_X), Util.wrap(pos[1], Game.DIM_Y)];
}

Game.prototype.checkCollisions = function() {
    for (let i = 0; i < this.allObjects().length - 1; i++) {
        for (let j = i+1; j < this.allObjects().length; j++) {
            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){
                // alert("COLLISION");
                this.allObjects()[i].collideWith(this.allObjects()[j]);
            }
        }
    }
}

Game.prototype.step = function() {
    this.moveObjects();
    this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
    let asteroidIndex = this.asteroids.indexOf(asteroid);
    this.asteroids.splice(asteroidIndex, 1)
}

Game.prototype.allObjects = function(){
    this.asteroids.concat([this.ship])
}


module.exports = Game;