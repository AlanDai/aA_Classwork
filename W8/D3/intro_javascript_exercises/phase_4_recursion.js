// range(start, end)

function range(start, end) {
    
    if(start === end) {
        return [start];
    }

    if(start > end) {
        return [start].concat(range(start - 1, end));
    } else {
        return [start].concat(range(start + 1, end));
    }

}

// sumRec(arr)
function sumRec(arr){
    if(arr.length === 0) {
        return 0;
    } else if(arr.length === 1) {
        return arr[0];
    }

    return arr[0] + sumRec(arr.slice(1));

}

// exponent1(base, exp)
function exponent1(base, exp) {
    if(exp === 0) {
        return 1;
    }

    return base * exponent1(base, exp - 1);

}

// exponent2base, exp)
function exponent2(base, exp) {
    if(exp === 0) {
        return 1;
    } else if(exp === 1){
        return base;
    }

    if(exp % 2 === 0) {
        return exponent2(base, exp/2) ** 2;
    } else {
        return base * (exponent2(base, (exp - 1)/2) ** 2);
    }
}

// fibonacci(n)

function fibonacci(n) {
    if(n === 1){
        return [0];
    } else if(n === 2){
        return [0, 1];
    }

    let fib = fibonacci(n-1);
    fib.push(fib[fib.length - 1] + fib[fib.length - 2]);
    return fib;

}

// deepDup(arr)

function deepDup(arr) {

    // base case:
    // if ele isn't an array, return ele
    if(!Array.isArray(arr)){
        return arr;
    } else if (arr.length === 0){
        return [];
    }

    let dupArray = [];
    
    for(let i = 0; i < arr.length; i++) {
        dupArray.push(deepDup(arr[i]));
    }

    return dupArray;

}

// bsearch(arr, target)

function bsearch(arr, target) {

    if(arr.length === 0) {
        return -1;
    }

    if(arr.length === 1 && arr[0] === target) {
        return 0;
    } 

    let mid = Math.floor(arr.length / 2);
    
    let left = arr.slice(0, mid);
    let right = arr.slice(mid + 1);

    if(arr[mid] === target) {
        return mid;
    } else if(arr[mid] < target) {
        let i = bsearch(right, target);
        if(i === -1) {
            return -1;
        } else {
            return mid + 1 + i;
        }
    } else {
        return bsearch(left, target);
    }
}

// mergesort(arr)

function mergesort(arr) {
    if(arr.length <= 1) {
        return arr;
    }

    let mid = Math.floor(arr.length / 2);
    let left = mergesort(arr.slice(0, mid));
    let right = mergesort(arr.slice(mid));
    return merge(left, right);
}

function merge(left, right) {
    let merged = [];

    while(left.length > 0 && right.length > 0) {
        if(left[0] < right[0]) {
            merged.push(left.shift());
        } else {
            merged.push(right.shift());
        }
    }

    return merged.concat(left, right);
}

// subsets(arr)

function subsets(arr) {
    if(arr.length <= 1) {
        return arr;
    }

    let allSubsets = subsets(arr.slice(0, arr.length - 1));

    for(let i = 0; i < allSubsets.length; i++) {
        allSubsets.push(allSubsets[i].concat(arr[arr.length  - 1]));

    }
    return allSubsets;
}