import UIKit

var str = "Hello, playground"

var a = 1;
var b = 1;
if b == 1 {
    print("b equals a")
}

9 % 4
-9 % 4
9 % -4

var i8:UInt8 = 255
//i8 = i8 + 1 //error
i8 = i8 &+ 1

var n: Int8 = -128
//n = n - 1 //error
n = n &- 1

let n1: Int? = nil
let n2 = "asdf"
print(n1 ?? n2)

func addNumber(n1: Int?, n2: Int?) -> Int {
    return (n1 ?? 0) + (n2 ?? 0)
}
addNumber(n1: nil, n2: 20)

for i in 1...5 { print(i) }
for i in 1..<5 { print(i) }
let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
for name in names[...2] { print(name) }
for name in names[2...] { print(name) }
let range = ...5
range.contains(7)
range.contains(5)
range.contains(-1)

let range2 = "a"..."z"
for char in "hello,  world" {
    if !range2.contains(String(char)) {
        print("\(char) is not lowercase letter")
    }
}

extension BinaryInteger {
    var binaryDescription: String {
        var binaryString = ""
        var internalNumber = self
        for _ in (1...self.bitWidth) {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
        }
        return binaryString
    }
    
}

let num: UInt8 = 8
num.binaryDescription
(~num).binaryDescription
(num & 1).binaryDescription
(num | 0).binaryDescription
(num ^ 8).binaryDescription
(num << 1).binaryDescription
(num >> 1).binaryDescription

let num2: Int8 = 127
num2.binaryDescription
let num3: Int8 = -127
(num3).binaryDescription
(num2 & num3).binaryDescription
(num2 | num3).binaryDescription
(num2 | num3).binaryDescription
let num4: Int8 = 16
num4.binaryDescription
(num4 << 3).binaryDescription
(num4 >> 3).binaryDescription
let num5: Int8 = -120
num5.binaryDescription
(num5 << 3).binaryDescription
(num5 >> 3).binaryDescription

let mask:UInt8 = 16
mask.binaryDescription
(mask & (mask - 1)).binaryDescription

func findLostNum(nums: [UInt]) -> UInt {
    var lostNum : UInt = 0
    for num in nums {
        lostNum = lostNum ^ num;
    }
    return lostNum
}

findLostNum(nums: [1, 2, 3, 4, 3, 2, 1])

var numA:UInt8 = 1
var numB:UInt8 = 2
var numC:UInt8 = 3
var numD:UInt8 = 4
var numE:UInt8 = 3
var numF:UInt8 = 2
var numG:UInt8 = 1
numA.binaryDescription
numB.binaryDescription
numB.binaryDescription
numC.binaryDescription
numD.binaryDescription
numE.binaryDescription
numF.binaryDescription
numG.binaryDescription
(numA ^ numB).binaryDescription

precedencegroup PowerPrecedence {
    associativity: left
    lowerThan: AdditionPrecedence
}

prefix operator +++
postfix operator ---
infix operator +-: AdditionPrecedence
infix operator *^: PowerPrecedence

struct Vector2D : CustomStringConvertible, Equatable {
    
    var x = 0.0
    var y = 0.0
    var description: String { get { return "Vector2D(x: \(x), y: \(y))"} }

    static func +(left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    
    static prefix func -(vec: Vector2D) -> Vector2D {
        return Vector2D(x: -vec.x, y: -vec.y)
    }
    
    static func +=(left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
    
    static func ==(left: Vector2D, right: Vector2D) -> Bool {
        return left.x == right.x && left.y == right.y
    }
    
    static prefix func +++(vec: inout Vector2D) {
        vec += vec
    }
    
    static postfix func ---(vec: inout Vector2D) {
        vec.x -= vec.x
        vec.y -= vec.y
    }
    
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
    
    static func *^ (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x * right.x, y: left.y * right.y)
    }
}

var vector1 = Vector2D(x: 3.0, y: 1.0)
var vector2 = Vector2D(x: 2.0, y: 4.0)
var vector3 = vector1 + vector2
vector3 = -vector3
vector3 += Vector2D(x: 2.0, y: 2.0)
vector1 == vector2
+++vector3
vector3---
vector1 +- vector2 *^ vector3
