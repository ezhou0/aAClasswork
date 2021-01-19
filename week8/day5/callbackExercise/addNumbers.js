const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback){

    if(numsLeft > 0){
        reader.question("Enter a number: ", function(input){
            let number = parseInt(input);
            sum += number;
            console.log(sum)
        
            addNumbers(sum, numsLeft-1, completionCallback);
        });
    }
    else{
        completionCallback(sum)
    }
}

addNumbers(0, 5, function (sum) {
    console.log('total sum: ' + sum);
    reader.close()
})
