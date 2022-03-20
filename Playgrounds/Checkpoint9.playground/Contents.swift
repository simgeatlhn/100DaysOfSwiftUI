import Cocoa


//Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.
//If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code.

let array: [Int]? = nil
let mindBlown = array?.randomElement() ?? Int.random(in: 1...100)
print(mindBlown)
