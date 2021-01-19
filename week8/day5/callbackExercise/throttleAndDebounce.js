Function.prototype.myThrottle = function(interval){
    let tooSoon = false;
    return(...args) => {
        if (tooSoon === false){
            tooSoon = true;
            setTimeout(function(){tooSoon = false;}, interval);
            this(...args);
        }
           
    };
};

// class Neuron {
//     fire() {
//         console.log("Firing!");
//     }
// }

// const neuron = new Neuron();
// // When we create a new Neuron,
// // we can call #fire as frequently as we want

// // The following code will try to #fire the neuron every 10ms. Try it in the console:
// // const interval = setInterval(() => {
// //     neuron.fire();
// // }, 10);

// // You can use clearInterval to stop the firing:
// // clearInterval(interval);

// // Using Function#myThrottle, we should be able to throttle
// // the #fire function of our neuron so that it can only fire
// // once every 500ms:
// neuron.fire = neuron.fire.myThrottle(500);
// const interval = setInterval(() => {
//     neuron.fire();
// }, 10);

// // interval();


