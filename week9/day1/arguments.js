function args_sum(){
    let sum = 0;
    for(let i = 0; i < arguments.length; i++){
        sum += arguments[i];
    }
    return sum;
}

// console.log(args_sum(1, 2, 3, 4) === 10);
// console.log(args_sum(1, 2, 3, 4, 5) === 15);

function args_sum2(...num){
    let sum = 0;
    for (let i = 0; i < num.length; i++) {
        sum += num[i];
    }
    return sum;
}
// console.log(args_sum2(1, 2, 3, 4) === 10);
// console.log(args_sum2(1, 2, 3, 4, 5) === 15);

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

Function.prototype.myBind = function(ctx){
    //arguments does NOT access myBind's arguments... we have to find a new way

    let that = this;
    let args =  Array.from(arguments).slice(1);
    return function daf(){
        let appendargs = Array.from(arguments);
        that.apply(ctx, args.concat(appendargs));
        //console.log(Array.from(arguments));
    };
};

Function.prototype.myBind = function(ctx, ...args){
   return (...appendargs) =>this.apply(ctx, args.concat(appendargs));
};


// class Dog {
//     constructor(name) {
//         this.name = name;
//     }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

function curriedSum(Arg){
    let nums = [];
    function _curriedSum(num){
        nums.push(num);

        if(nums.length === Arg){
            total = 0;
            for(let i = 0; i < Arg; i++){
                total += nums[i]; 
            }
            return total; 
        }
        return _curriedSum;  
    }
    return _curriedSum;
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56


Function.prototype.curry = function(numArgs){
    let arg = [];
    let that = this;
    return function curriedfunction(num){
        arg.push(num);
        if(arg.length === numArgs){
            total = 0;
            for (let i = 0; i < numArgs; i++) {
                total += arg[i];
            }
            return total; 
        }
        return curriedfunction;
    };
    return curriedfunction;
};

console.log([5,30,20,1].curry(4));