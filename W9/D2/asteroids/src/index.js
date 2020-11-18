const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");
const Util = require("./utils.js")

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;
window.GameView = GameView;
window.Util = Util;

window.addEventListener('DOMContentLoaded', function () {
    let canvas = document.getElementById("game-canvas");
    this.context = canvas.getContext("2d");

    new GameView(new Game(), this.context).start();
});

console.log("Webpack is still... working?");





