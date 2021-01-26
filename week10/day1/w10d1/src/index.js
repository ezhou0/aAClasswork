const DOMNodeCollection = require("./dom_node_collection");


console.log("in index");


window.$l = function $l(arg) {
  if (arg instanceof HTMLElement){
    return new DOMNodeCollection([arg]);
  }

  const nodeList = document.querySelectorAll(arg);
  const nodeArray = Array.from(nodeList);
  return new DOMNodeCollection(nodeArray);
};