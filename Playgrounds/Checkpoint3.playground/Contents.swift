import Cocoa

//The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number:

//1-If it’s a multiple of 3, print “Fizz”
//2-If it’s a multiple of 5, print “Buzz”
//3-If it’s a multiple of 3 and 5, print “FizzBuzz”
//4-Otherwise, just print the number.


//func -switch-case
func fizzbuzz(number: Int) -> String {
    switch(number % 3 == 0 , number % 5 == 0)  {
    case(true,false):
        return "Fizz"
    case(false , true):
        return "Buzz"
    case(true,true):
        return "FizzBuzz"
    case(false,false):
        return String(number)
    }
}

print(fizzbuzz(number:15))



//for - if-else
for i in 1...100{
    if i % 3 == 0{
        if i % 5 == 0 {
            print("FizzBuzz")
        }else{
            print("Fizz")
        }
    }else if i % 5 == 0{
        print("Buzz")
    }else{
        print("\(i)")
    }
}
