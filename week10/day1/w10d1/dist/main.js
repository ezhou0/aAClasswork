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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/***/ ((module) => {

eval("class DOMNodeCollection{\n    constructor(nodesArray){\n        this.nodesArray = nodesArray;\n    }\n\n    html(string){\n        if(typeof string === 'undefined'){\n            this.nodesArray[0].innerHTML;\n        }else{\n            this.nodesArray.forEach((node)=>{\n                node.innerHTML = string;\n            });\n        }\n    }\n\n    empty(){\n        this.html('');\n    }\n\n    append(child){\n        //debugger\n        this.nodesArray.forEach( (node) => {\n            if(typeof child === 'string'){\n                node.innerHTML += child;\n            } else if (child instanceof HTMLElement){\n                node.appendChild(child.cloneNode());\n            }else {\n                child.each( (ele) => {\n                    node.appendChild(ele.cloneNode());\n                });\n            }\n            \n        });\n    }\n\n    attr(key, val) {\n        if (typeof val === 'string') {\n            this.nodesArray.forEach((node) => {\n                node.setAttribute(key, val);\n            });\n        } else {\n            return this.nodesArray[0].getAttribute(key);\n        }\n        \n    }\n\n    addClass(newClass) {\n        this.forEach( (node) => {\n            node.classList.add(newClass);\n        });\n    }\n\n    removeClass(oldClass) {\n        this.forEach( (node) => {\n            node.classList.remove(oldClass);\n        });\n    }\n\n    children(){\n       let childArray = [];\n       this.nodesArray.forEach((node) =>{\n            let temp = node.children;\n            if(temp.length){\n                temp = Array.from(temp);\n                childArray = childArray.concat(temp);\n            }\n\n       });\n       return new DOMNodeCollection(childArray);\n    }\n\n    parent(){\n        let parentArr = [];\n        this.nodesArray.forEach((node) =>{\n            let temp = node.children;\n            if(temp.length){\n                parentArr.push(node);\n            }\n\n       });\n       return new DOMNodeCollection(parentArr)\n       // a --> b --> c\n    }\n\n    find(selector) {\n        let foundNodes = [];\n        this.nodesArray.forEach( (node) => {\n            let nodeList = node.querySelectorAll(selector)\n            foundNodes = foundNodes.concat(Array.from(nodeList))\n        })\n\n        return new DOMNodeCollection(foundNodes)\n    }\n\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

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
eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\r\n\r\n\r\nconsole.log(\"in index\");\r\n\r\n\r\nwindow.$l = function $l(arg) {\r\n  if (arg instanceof HTMLElement){\r\n    return new DOMNodeCollection([arg]);\r\n  }\r\n\r\n  const nodeList = document.querySelectorAll(arg);\r\n  const nodeArray = Array.from(nodeList);\r\n  return new DOMNodeCollection(nodeArray);\r\n};\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;