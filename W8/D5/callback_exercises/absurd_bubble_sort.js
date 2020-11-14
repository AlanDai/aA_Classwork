const readline = require('readline')

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const askIfGreaterThan = (el1, el2, callback) => {
    reader.question("Is the first element greater than the second element?", function(answer) {
        if(answer === "yes") {
            callback(true);
        } else if(answer === "no") {
            callback(false);
        }
    });
}

// askIfGreaterThan(9, 3, isGreater => {
//     isGreater ? (console.log("You said element one is greater!")) : (console.log("You said element two is greater!"))
// });

const innerBubbleSortLoop = (arr, i, madeAnySwaps, outerBubbleSortLoop) => {
    if( i == ( arr.length - 1 ) ) {
        outerBubbleSortLoop(madeAnySwaps);
        return;
    }

    askIfGreaterThan( arr[i], arr[i+1], isGreaterThan => {
        if( isGreaterThan ){
            [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
            madeAnySwaps = true;
        }
        innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop)
    })
}

// arr = [1,2,3,4,3,5];
// innerBubbleSortLoop(arr, 0, false, () => console.log("In outer bubble sort."));
// console.log(arr)

const absurdBubbleSort = (arr, sortCompletionCallback) => {

    const outerBubbleSortLoop = (madeAnySwaps) => {
        if( madeAnySwaps == true ){
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            sortCompletionCallback(arr);
        }
    }

    outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});