import Cocoa


//To check your knowledge, here’s a small task for you:

//create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

struct Car{
    let model :String
    let numberSeats:Int
    var gear = 10
    
    mutating func changeGear(currentGear: Int){
        if  gear == currentGear {
            gear -= 1
            print("you should drive slowly")
        }else{
            print("Good job")
        }
    }
}

var car = Car(model:"Mercedes",numberSeats: 5)
car.changeGear(currentGear: 10)
print(car.gear)
print(car.model)
