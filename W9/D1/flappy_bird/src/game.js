import Level from "./level"
import Bird from "./bird"

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.restart();
  }

  restart() {
    this.score = 0;
    this.bird = new Bird(this.dimensions);
    this.level = new Level(this.dimensions);
    this.animate();
  }

  gameOver() {
    return true;
  }

  animate () {
    this.level.animate(this.ctx);
    this.bird.animate(this.ctx);

    if(this.gameOver()){
      this.restart();
    }
  }
}