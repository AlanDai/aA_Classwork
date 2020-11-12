// Array#myEach(callback)

Array.prototype.myEach = function(callback) {

    for(let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

// Array#myMap(callback)

Array.prototype.myMap = function(callback) {
    let mapped = [];
    this.myEach((ele) => mapped.push(callback(ele)));
    return mapped; 
}

// Array#myReduce(callback[, initialValue])

Array.prototype.myReduce = function(callback, initialValue) {
    let reducedValue; 
    let arr;
    
    if(initialValue === undefined){
        reducedValue = this[0];
        arr = this.slice(1);
    } else {
        reducedValue = initialValue;
        arr = this;
    }

    arr.myEach((ele) => reducedValue = callback(reducedValue, ele));
    return reducedValue;
}