class DOMNodeCollection{
    constructor(nodesArray){
        this.nodesArray = nodesArray;
    }

    html(string){
        if(typeof string === 'undefined'){
            this.nodesArray[0].innerHTML;
        }else{
            this.nodesArray.forEach((node)=>{
                node.innerHTML = string;
            });
        }
    }

    empty(){
        this.html('');
    }

    append(child){
        //debugger
        this.nodesArray.forEach( (node) => {
            if(typeof child === 'string'){
                node.innerHTML += child;
            } else if (child instanceof HTMLElement){
                node.appendChild(child.cloneNode());
            }else {
                child.each( (ele) => {
                    node.appendChild(ele.cloneNode());
                });
            }
            
        });
    }

    attr(key, val) {
        if (typeof val === 'string') {
            this.nodesArray.forEach((node) => {
                node.setAttribute(key, val);
            });
        } else {
            return this.nodesArray[0].getAttribute(key);
        }
        
    }

    addClass(newClass) {
        this.forEach( (node) => {
            node.classList.add(newClass);
        });
    }

    removeClass(oldClass) {
        this.forEach( (node) => {
            node.classList.remove(oldClass);
        });
    }

    children(){
       let childArray = [];
       this.nodesArray.forEach((node) =>{
            let temp = node.children;
            if(temp.length){
                temp = Array.from(temp);
                childArray = childArray.concat(temp);
            }

       });
       return new DOMNodeCollection(childArray);
    }

    parent(){
        let parentArr = [];
        this.nodesArray.forEach((node) =>{
            let temp = node.children;
            if(temp.length){
                parentArr.push(node);
            }

       });
       return new DOMNodeCollection(parentArr);
       // a --> b --> c
    }

    find(selector) {
        let foundNodes = [];
        this.nodesArray.forEach( (node) => {
            let nodeList = node.querySelectorAll(selector);
            foundNodes = foundNodes.concat(Array.from(nodeList));
        });

        return new DOMNodeCollection(foundNodes);
    }

    remove(){
        this.nodesArray.forEach((el) => {
            el.innerHTML = undefined;
        });
    }
   on(event, callback){
        this.addEventListener(event, callback);
   }

    off(event, callback) {
        this.removeEventListener(event, callback);
    }

}

module.exports = DOMNodeCollection;