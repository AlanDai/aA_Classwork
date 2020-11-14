Function.prototype.myThrottle = function(interval){
    let tooSoon = false;
    return (...args) => {
        if(!tooSoon){
            tooSoon = true;
            setTimeout(() => tooSoon = false, interval);
            this(...args);
        }
    }
}

// class Neuron {
//   fire() {
//     console.log("Firing!");
//   }
// }

// const neuron = new Neuron();

// const interval = setInterval(() => {
//   neuron.fire();
// }, 10);

// clearInterval(interval);

// neuron.fire = neuron.fire.myThrottle(500);