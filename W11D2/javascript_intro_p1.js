function madLib(verb, adjective, noun) {
    return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

console.log(madLib('make', 'best', 'guac')); //=> We shall MAKE the BEST GUAC.

function isSubstring(searchString, subString) {
    return searchString.includes(subString);
}

console.log(isSubstring("time to program", "time")); //=> true
console.log(isSubstring("Jump for joy", "joys")); //=> false

function isPrime(num) {
    if (num < 2) return false;
    for(let i = 2; i <= (num / 2); i++) {
        if (num % i === 0) return false
    }
    return true
}

console.log(isPrime(2)); //=> true
console.log(isPrime(10)); //=> false
console.log(isPrime(15485863)); //=> true
console.log(isPrime(3548563)); //=> false

function sumOfNPrimes(n) {
    let found = 0;
    let sum = 0;
    let num = 1;
    while (found < n) {
        if (isPrime(num)) {
            sum += num;
            found += 1;
        }
        num += 1
    }
    return sum
}

console.log(sumOfNPrimes(0)) //=> 0
console.log(sumOfNPrimes(1)) //=> 2
console.log(sumOfNPrimes(4)) //=> 17