import Cocoa
//Checkpoint5


//With closures under your belt, it’s time to try a little coding challenge using them.

//You’ve already met sorted(), filter(), map(), so I’d like you to put them together in a chain – call one, then the other, then the other back to back without using temporary variables.

//Your input is this:

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
//Your job is to:

//1-Filter out any numbers that are even
//2-Sort the array in ascending order
//3-Map them to strings in the format “7 is a lucky number”
//4-Print the resulting array, one item per line
//5-So, your output should be as follows:

//Solution1
let isEven = {(number :Int) -> Bool in
    !number.isMultiple(of:2)
}

let printPerLine = { (item:String) -> Void in
    print(item)
}

let isLuckyNumber = {(num : Int) -> String in
    "\(num) is lucky number"
}

luckyNumbers.filter(isEven).sorted().map(isLuckyNumber).map(printPerLine)

//Solution 2
//parametre tanımlamak yerine $0 kullandık
let luckyNumbers2 = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49].filter{!$0.isMultiple(of: 2)}.sorted{$0 < $1}.map{String($0) + " is a lucky number"}

for i in 0..<luckyNumbers2.count{
    print("\n\(luckyNumbers2[i])")
}
