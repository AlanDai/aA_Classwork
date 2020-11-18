/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is not neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\n\nconst DEFAULTS = {\n  COLOR: \"purple\",\n  RADIUS: 25,\n  SPEED: 4\n};\n\nfunction Asteroid (options) {\n    options = options || {};\n    options.color = DEFAULTS.COLOR;\n    options.pos = options.pos || options.game.randomPosition();\n    options.radius = DEFAULTS.RADIUS;\n    options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);\n    \n\n    MovingObject.call(this, options);\n};\n\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.remove = function remove(otherObject) {\n  if(otherObject instanceof Ship) {\n    otherObject.relocate();\n  }\n};\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/*! CommonJS bailout: module.exports is used directly at 72:0-14 */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\")\n\nfunction Game() {\n    this.asteroids = this.addAsteroids();\n    this.ship = new Ship({game: this});\n}\n\nGame.DIM_X = 500;\nGame.DIM_Y = 500;\nGame.NUM_ASTEROIDS = 30;\n\nGame.prototype.addAsteroids = function() {\n    let asteroids = [];\n    for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n        asteroids.push(new Asteroid({pos: this.randomPosition(), game: this}));\n\n    }\n    return asteroids;\n}\n\nGame.prototype.randomPosition = function() {\n    let x = Math.random() * Game.DIM_X;\n    let y = Math.random() * Game.DIM_Y;\n    return [x, y];\n}\n\nGame.prototype.draw = function(context) {\n    context.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n    for (let i = 0; i < this.allObjects().length; i++) {\n        this.allObjects()[i].draw(context);\n    }\n}\n\nGame.prototype.moveObjects = function(){\n    for (let i = 0; i < this.allObjects().length; i++) {\n      this.allObjects()[i].move();\n    }\n}\n\nGame.prototype.warp = function(pos){\n    return [Util.wrap(pos[0], Game.DIM_X), Util.wrap(pos[1], Game.DIM_Y)];\n}\n\nGame.prototype.checkCollisions = function() {\n    for (let i = 0; i < this.allObjects().length - 1; i++) {\n        for (let j = i+1; j < this.allObjects().length; j++) {\n            if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])){\n                // alert(\"COLLISION\");\n                this.allObjects()[i].collideWith(this.allObjects()[j]);\n            }\n        }\n    }\n}\n\nGame.prototype.step = function() {\n    this.moveObjects();\n    this.checkCollisions();\n}\n\nGame.prototype.remove = function(asteroid) {\n    let asteroidIndex = this.asteroids.indexOf(asteroid);\n    this.asteroids.splice(asteroidIndex, 1)\n}\n\nGame.prototype.allObjects = function(){\n    this.asteroids.concat([this.ship])\n}\n\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(game, context){\n    this.game = game;\n    this.context = context;\n}\n\nGameView.prototype.start = function (){\n    let that = this;\n    setInterval(function() {\n        that.game.step();\n        that.game.draw(this.context);\n    }, 20);\n}\n\nmodule.exports = GameView;\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\n\nfunction MovingObject (options) {// pos, vel, radius, color) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    this.game = options.game;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n\n    ctx.beginPath();\n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0,\n        2 * Math.PI,\n        false\n    );\n    ctx.fillStyle = this.color;\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function() {\n\n    [dx, dy] = this.vel;\n    [x, y] = this.pos;\n    // debugger\n    this.pos = this.game.warp([x + dx, y + dy]);\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n    if(Util.distance(this.pos, otherObject.pos) < (this.radius + otherObject.radius)){\n        return true;\n    } else {\n        return false;\n    }\n\n}\n\nMovingObject.prototype.collideWith = function(otherObject){\n    // this.game.remove(otherObject);\n    // this.game.remove(this);\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\n\nconst DEFAULTS = {\n    COLOR: \"blue\",\n    RADIUS: 50,\n};\n\nfunction Ship(options) {\n    options = options || {};\n    options.color = DEFAULTS.COLOR;\n    options.pos = options.pos || options.game.randomPosition();\n    options.radius = DEFAULTS.RADIUS;\n    options.vel = options.vel || [0, 0];\n    \n\n    MovingObject.call(this, options);\n};\n\nShip.prototype.relocate = function() {\n    this.pos = this.game.randomPosition();\n    this.vel = [0, 0];\n}\n\nUtil.inherits(Ship, MovingObject);\n\nmodule.exports = Ship;\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate(){};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length=50) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    },\n\n    wrap(pos, max){\n        if(pos >= max){\n            return pos % max;\n        }else if(pos < 0){\n            return max + pos;\n        }else{\n            return pos;\n        }\n    },\n\n    distance(pos1, pos2){\n        return Math.sqrt( (pos1[0] - pos2[0])**2 + (pos1[1] - pos2[1])**2 );\n    }\n};\n\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\nwindow.GameView = GameView;\nwindow.Util = Util;\n\nwindow.addEventListener('DOMContentLoaded', function () {\n    let canvas = document.getElementById(\"game-canvas\");\n    this.context = canvas.getContext(\"2d\");\n\n    new GameView(new Game(), this.context).start();\n});\n\nconsole.log(\"Webpack is still... working?\");\n\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;