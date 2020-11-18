const Game = require("./game.js");

function GameView(game, context){
    this.game = game;
    this.context = context;
}

GameView.prototype.start = function (){
    let that = this;
    setInterval(function() {
        that.game.step();
        that.game.draw(this.context);
    }, 20);
}

module.exports = GameView;
