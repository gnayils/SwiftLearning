import UIKit

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs { print("\(animalName) has \(legCount) legs") }
for t in numberOfLegs { print("\(t.0) has \(t.1) legs") }
let base = 3, power = 5; var answer = 1;
for _ in 1...power { answer *= base }
let minuteInterval = 5
for tickMark in stride(from: 0, to: 50, by: minuteInterval) { print(tickMark)}
for tickMark in stride(from: 0, through: 50, by: minuteInterval) { print(tickMark)}
let points = [(0, 0), (1, 0),(1, 1),(2, 0),(2, 1)]
for (x, y) in points where y == 0 {
    print("\(x) and \(y)")
}
let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
for case let number? in arrayOfOptionalInts {
    print("found a \(number)")
}
let someOptional: Int? = 42
if case .some(let x) = someOptional { print(x) };

var count = 0
repeat { print(count); count += 1} while count < 5
while count > 0 {
    print(count)
    count -= 1
}
var number = 10
whileLoop : while number > 0 {
    switch number {
    case 9:
        print(9)
    case 10:
        var sum = 0;
        for i in 0...10 {
            sum += i
            if i == 9 {
                print(sum)
                print("break while loop")
                break whileLoop //continue whileLoop
            }
        }
    default:
        break;
    }
    print("number -= 1")
    number -= 1;
}
print("out the while loop")

let anotherChar : Character = "a"
switch  anotherChar {
case "a", "A":
    print("the letter a")
default:
    print("not the letter a")
}

let approximateCount = 1000
let countedThings = "moons orbiting saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 12..<100:
    naturalCount = "serveral"
case 100..<1000:
    naturalCount = "hundreds of"
case 1000..<10000:
    naturalCount = "thousands of"
    fallthrough
default:
    naturalCount = "many"
}
print("there are \(naturalCount) \(countedThings)")

let somePoint = (1, 1)
switch somePoint {
case(0, 0):
    print("\(somePoint.0), \(somePoint.1) at the origin")
case (_, 0):
    print("0, \(somePoint.1) on the x-axis")
case (-2...2, -2...2):
    print("\(somePoint.0), \(somePoint.1) inside the box")
default:
    print("\(somePoint.0), \(somePoint.1) outside the box")
}

let anotherPoint = (2, 1)
switch anotherPoint {
case(let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at \(x), \(y)")
}

let yetAnotherPoint = (2, 1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("\(x), \(y) on the line x == y")
case let (x, y) where x == -y:
    print("\(x), \(y) on the line x == -y")
case let (x, y):
    print("\(x), \(y) just some arbitrary point")
}

let stillAnotherPoint = (0, 9)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("on an axis, \(distance) from the origin")
default:
    print("not on an axis")
}

struct Employee { var salary: Float }
let e = Employee(salary: 9999)
func ~=(lhs: Range<Float>, rhs: Employee) -> Bool {
    return lhs.contains(rhs.salary)
}
switch e {
case 0..<1000:
    print("tough living")
case 1000..<5000:
    print("good living")
case 5000..<10000:
    print("great living")
default:
    break;
}


if #available(iOS 10,  macOS 10.18, *) {
    print("macos 10.12")
}

protocol Animal {
    var name: String {get}
}
struct Dog : Animal {
    var name: String { return "dog" }
    var runSpeed: Int
}
struct Bird : Animal {
    var name: String { return "bird" }
    var flightHeight: Int
}
struct Fish : Animal {
    var name : String  { return "fish" }
    var depth : Int
}
let animals: [Any] = [Dog(runSpeed: 55), Bird(flightHeight: 2000), Fish(depth: 100)]
for animal in animals {
    switch animal {
    case let dog as Dog:
        print("\(dog.name) can run \(dog.runSpeed)")
    case let fish as Fish:
        print("\(fish.name) can dive depth (\(fish.depth)")
    case is Bird:
        print("bird can fly")
    default:
        print("unknow animal")
    }
}
