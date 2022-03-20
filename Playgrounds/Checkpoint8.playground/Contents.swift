import Cocoa

//Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

//1- A property storing how many rooms it has.
//2- A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
//3- A property storing the name of the estate agent responsible for selling the building.
//4- A method for printing the sales summary of the building, describing what it is along with its other properties.


protocol Build {
    var rooms : Int {get}
    var cost : Int {get}
    var name :String {get}
    
    func printBuild()
}

extension Build{
    func printBuild(){
        print("This property has been put up for sale by real estate agent \(name). It has \(rooms) and its price: $\(cost)")
    }
}

struct House : Build{
    var rooms: Int
    var cost :Int
    var name:String
}

struct Office: Build {
    var rooms:Int
    var cost:Int
    var name:String
}

let myHome = House(rooms: 4 ,cost: 500_000, name:"Simge")
myHome.printBuild()

let myOffice = Office(rooms: 6, cost: 200_000, name: "Bahar")
myOffice.printBuild()




