import Cocoa

//Now that you understand how classes work, and, just as importantly, how they are different from structs, it’s time to tackle a small challenge to check your progress.

//Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

//But there’s more:

//1-The Animal class should have a legs integer property that tracks how many legs the animal has.
//2-The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
//3-The Cat class should have a matching speak() method, again with each subclass printing something different.
//4-The Cat class should have an isTame Boolean property, provided using an initializer.


class Animal {
    var legs:Int

    //initializer unutma!
    init(legs: Int){
        self.legs = legs
    }
}

class Dog : Animal {
    func talk(){
        print("Hav hav")
    }
}

class Cat: Dog {
    override func talk(){
        print("miav miav")
    }
}

let corgi = Dog(legs: 4)
corgi.talk()
let catty = Cat(legs: 4)
catty.talk()
