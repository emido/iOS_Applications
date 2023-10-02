import UIKit

var greeting = "Hello, playground"

let newConst : Float = 4

let label1 = "this is a label"
let width = 44
let widthLabel = label1 + String(width)
print(widthLabel)

let optName : String? = "Maryam"
if let name = optName {
    print("hello \(name)")
}
else{
    print("hello friend!")
}


var largest = 0
var largestGroup = ""
let interestingNumbers = [
    "Prime" : [2,3,5,7,11,13],
    "Fibonacci" : [1,1,2,3,5,8],
    "Square" : [1,4,9,16,25]
]

for (group, numbers) in interestingNumbers{
    for number in numbers{
        if number > largest{
            largest = number
            largestGroup = group
        }
    }
}
print("largest number is \(largest) which is in the \(largestGroup) group")



var n = 2
while n < 0 {
    n *= 2
}

print(n)

var m = 2

repeat {
    m *= 2
} while m < 2
            
print(m)


var numbers = [20,21,22,23,24]
numbers.map ({ (number:Int) -> Int in
    var val = 0
    let remaining = number % 2
    if remaining != 0 {
        val = 0
    }
    else{
        val = number
    }
    return val
})
