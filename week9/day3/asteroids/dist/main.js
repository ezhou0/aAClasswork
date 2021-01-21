/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options){\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n    \n}\n\nMovingObject.prototype.draw = function draw(ctx){\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n    ctx.arc(\n        this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true\n    );\n    ctx.fill();\n};\n\nMovingObject.prototype.move = function move(ctx){\n    this.pos = [this.pos[0] + this.vel[0], this.pos[1]+this.vel[1]];\n};\n\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

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
eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\ndocument.addEventListener(\"DOMContentLoaded\", function () {\n    const canvasEl = document.getElementsByTagName(\"canvas\")[0];\n    const ctx = canvasEl.getContext(\"2d\");\n\n\n    window.MovingObject = MovingObject;\n    const mo = new MovingObject({\n        pos: [30, 30],\n        vel: [10, 10],\n        radius: 5,\n        color: \"#00FF00\"\n    });\n    mo.draw(mo.color);\n    window.Asteroid = Asteroid;\n    const ast = new Asteroid({\n        pos: [35, 35] \n    })\n\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;