import UIKit

//  while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.



var multipliedValue = 1
var number = 1

while number <= 20 {
    if number % 2 != 0 {
        multipliedValue *= number
    }
    number += 1
}

print("The multiplied value of all odd numbers from 1 to 20 is: \(multipliedValue)")


//    შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

let String = "Iphone"
var reversedString = ""

for character in String.reversed() {
    reversedString.append(character)
}

print("Reversed String: \(reversedString)")


//  while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."


//var trafficLight = "🔴"
//var isGreen = false
//
//while true {
//    switch trafficLight {
//    case "🔴":
//        trafficLight = "🌕"
//    case "🌕":
//        trafficLight = isGreen ? "🟢" : "🔴"
//        isGreen.toggle()
//    case "🟢":
//        trafficLight = "🔴"
//    default:
//        break
//    }
//    print(trafficLight, terminator: "->")
//}

//    Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”

var numberOfTickets = 4
while numberOfTickets > 0 {
    print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(numberOfTickets) \(numberOfTickets == 1 ? "ბილეთი" : "ბილეთი")")
          numberOfTickets -= 1
}
print("ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე")


//    შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

let array = [1, 2, 3, 3, ]


let distinctElements = Set(array)
let result = distinctElements.count == array.count ? "array-ში ყველა ელემენტი განსხვავებულია" : "array შეიცავს მსგავს ელემენტებს"

print(result)

//   დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას



let differenceClosure = { (number1: Int, number2: Int) -> Int in
    return number1 - number2
}

let result1 = differenceClosure(8, 2)
print("The difference is: \(result1)")


//    დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.


func countConsonants(in string: String) {
    let consonants: Set<Character> = Set("bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ")
    var count = 0

    for character in string {
        if consonants.contains(character) {
            count += 1
        }
    }

    print("Number of consonants in the string: \(count)")
}
let inputString = "iphone asworebs"
countConsonants(in: inputString)

