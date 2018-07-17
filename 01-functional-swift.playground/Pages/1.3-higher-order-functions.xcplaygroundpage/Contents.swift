/*:
 ## Session 1: Functional Swift
 ### 1.4 Higher-order Functions
 */

/* Speaker Notes
 Higher order functions are simply functions that operate on other functions by either taking a function as an argument, or returning a function.
 
 Swift provides us a lot of functions in standard library and we are going to discuss some of them like
 - Map
 - compactMap
 - Filter
 - Reduce
 */

import UIKit

//1. Transform [1,2,3,4,5] into Squares
//1.1 Using For Loop
var transformedArray = [Int]()
for number in (1...5) {
    transformedArray.append(number * number)
}
transformedArray

//1.2 Using Map
let transformed = (1...5).map { $0 * $0 }
transformed

//1.
let names = ["Delhi","Banglore","Gurgaon"]
let lenghtsOfStrings = names.map { $0.count }
lenghtsOfStrings

//2.
let fruits = ["Apple","Oranges","Grapes"]
let upperFruits = fruits.map { $0.uppercased() }
upperFruits

//3.
let scores = [100,80,86]
let formatted = scores.map { "Your score was \($0)" }
formatted
let passOrFail = scores.map { $0 > 85 ? "Pass" : "Fail" }
passOrFail

//4.
let i: Int? = 10 //nil
let j = i.map { "Value is \($0)" } //?? "Unknown Value"
j

//2 Convert [[1,2,3],[4,5,6],[7,8,9]] to [1,2,3,4,5,6,7,8,9]
//2.1 Using For Loop
var compactMappedArray = [Int]()
for array in [[1,2,3],[4,5,6],[7,8,9]] {
    for number in array {
        compactMappedArray.append(number)
    }
}
compactMappedArray

//2.2 Using compactMap
let compactMapped = [[1,2,3],[4,5,6],[7,8,9]].compactMap { $0 }
compactMapped

//1.
let albums = ["Encore",nil,"Recovery",nil,"Revival"]
let mapAlbums = albums.map { $0 } // [String?]
mapAlbums
let compactMapAlbums = albums.compactMap { $0 } // [String]
compactMapAlbums

//2.
let points = ["100","80","Fish","45"]
let compactMapPoints = points.compactMap { Int($0) }
compactMapPoints

//3.
let contents = (1...10).compactMap { try? String(contentsOfFile: "someFile-\($0).txt") }
contents

//4.
let vw = UIView()
let labels = vw.subviews.compactMap { $0 as? UILabel }

//3. Filter even numbers from [1,2,3,4,5]
//3.1 Using For Loop
var filteredArray = [Int]()
for number in (1...5) {
    if number % 2 == 0 {
        filteredArray.append(number)
    }
}
filteredArray

//3.2 Using Filter
let filtered = (1...5).filter { $0 % 2 == 0 }
filtered

//1.
let people = ["Mr A","Mrs B","Mr C","Mrs D"]
let mr = people.filter { $0.hasPrefix("Mr ") }
mr

//2.
let optionals: [String?] = ["A",nil,"B",nil,"C"]
let filter = optionals.filter { $0 != nil }
filter

//3.
let dictionary = ["Rahul": 100, "AarKay": 40, "Foo": 86]
let toppers = dictionary.filter { $1 > 80 }
toppers

//4. Calculate the sum of [1,2,3,4,5]
//5.1 Using For Loop
var reducedNumber = 0
for number in (1...5) {
    reducedNumber += number
}
reducedNumber

//4.2 Using Reduce
let reduced = (1...5).reduce(0) { $0 + $1 }
reduced

//1.
let animals = ["Lion", "Tiger", "Deer"]
let longEnough = animals.reduce(true) { $0 && $1.count > 3 }
longEnough
let longest = animals.reduce("") { $0.count > $1.count ? $0 : $1 }
longest

//2.
let numbers = [[1,2,3],[4,5,6],[7,8,9]]
let flattened = numbers.reduce([]) { $0 + $1 }
flattened
