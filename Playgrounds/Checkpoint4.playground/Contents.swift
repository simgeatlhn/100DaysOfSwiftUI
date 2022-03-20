import Cocoa


//The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

//1-You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
//2-If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
//3-You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
//4-If you can’t find the square root, throw a “no root” error.


//Step 1
enum squareError : Error {
    case noRoot,outOfBounds
}

//Step 2
func squareRoot(_ number:Int) throws -> String {
    
    if number < 1 && number > 100 {
        throw squareError.outOfBounds
    }
    
    for i in 1...10_000{
        if number == i * i {
            return "root: \(i)"
        }
    }
    
    throw squareError.noRoot
}

//Step 3
do {
    let result = try squareRoot(144)
    print("\(result)")
} catch squareError.noRoot{
        print("no root")
}catch squareError.outOfBounds{
    print("out of bounds")
}






