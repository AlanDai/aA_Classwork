// =============================================================================
// sum

function argumentsSum(){
    let mySum = 0;
    for (let i = 0; i < arguments.length; i++) {
        mySum += arguments[i];
    }
    return mySum;
}

function spreadSum(...numbers){
    let mySum = 0;
    for(let i = 0; i < numbers.length; i++){
        mySum += numbers[i];
    }
    return mySum;
}

// Examples:
// console.log(argumentsSum(1,2,3,4))
// console.log(spreadSum(1,2,3,4))
// console.log(spreadSum(...[1,2,3,4]))


// =============================================================================
// bind

Function.prototype.myBind = function(context) {
    const that = this;
    let realArgs = Array.from(arguments).slice(1);
    return function callback() {
        const callArgs = Array.from(arguments);
        return that.apply(context, realArgs.concat(callArgs));
    }
}

Function.prototype.myBind2 = function (context, ...bArgs) {
    const that = this;
    return function callback(...cArgs) {
        return that.apply(context, bArgs.concat(cArgs));
    }

    // return (...cArgs) => this.apply(context, bArgs.concat(cArgs));
}

// // Examples:
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
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


// =============================================================================
// curriedSum

function curriedSum(numArgs) {
    let numbers = [];
    
    function _curriedSum(num) {
        numbers.push(num);

        if(numbers.length === numArgs){
            let total = 0;
            for (let i = 0; i < numbers.length; i++) {
                total += numbers[i];
            }
            console.log(total);
            return total;
        }else{
            console.log(" + ");
            return _curriedSum;
        }
    }
    return _curriedSum;
}

// Examples:
// const sum = curriedSum(4);
// sum(5)(30)(20)(1); // => 56


// =============================================================================
// Function.prototype.curry

Function.prototype.curryApply = function(numArgs, context = null) {
    
    let numbers = [];
    const that = this;
    function _curriedSum(arg) {
        numbers.push(arg);

        if(numbers.length === numArgs){
            return that.apply(context, numbers);
        }else{
            console.log(" + ");
            return _curriedSum;
        }
    }
    return _curriedSum
}

Function.prototype.currySpread = function(numArgs) {
    let numbers = [];
    const that = this;
    function _curriedSum(arg) {
        numbers.push(arg);

        if(numbers.length === numArgs){
            return that(...numbers);
        }else{
            console.log(" + ");
            return _curriedSum;
        }
    }
    return _curriedSum
}

// Examples:
function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}
// sumThree(4, 20, 6);
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
// f1 = f1(20); // should break
console.log(f1);