// Array#uniq

Array.prototype.uniq = function() {
    let res = [];
    for(let i = 0; i < this.length; i ++){
        if(!res.includes(this[i])){
            res.push(this[i]);
        }
    }
    return res
}

// Array#twoSum

Array.prototype.twoSum = function() {
    let pairs = [];
    for(let i = 0; i < this.length-1; i ++) {
        for(let j = i+1; j < this.length; j ++) {
            if(this[i] + this[j] === 0){
                pairs.push([i, j]);
            }
        }
    }
    return pairs;
}

// Array#transpose

Array.prototype.transpose = function() {
    // let transposed = new Array(this[0].length).fill(0).map(() => new Array(this.length).fill(0));

    let transposed = Array.from(Array(this[0].length), () => new Array(this.length));

    for(let i = 0; i < this.length; i ++){
        for(let j = 0; j < this[0].length ; j ++){
            transposed[i][j] = this[j][i];
        }
    }
    return transposed;
}