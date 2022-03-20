import Cocoa

//1-You should start by creating an array of strings, using something like let albums = ["Red", "Fearless"]
//2-You can read the number of items in your array using albums.count.
//3-count also exists for sets.
//4-Sets can be made from arrays using Set(someArray)
//5-Sets never include duplicates.

var myArray = ["Bahar","Yasemin","Berna","Gizem","Suna"]
print(myArray.count)

var friends = Set(["Bahar","Yasemin"])
print(friends.count)
