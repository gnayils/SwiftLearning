import UIKit

func findMinMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {return nil}
    var min = array[0]
    var max = array[0]
    for value in array[1..<array.count] {
        if value < min {
            min = value
        } else if value > max{
            max = value
        }
    }
    return (min, max)
}

if let bounds = findMinMax(array: [8, -6, 2, 109, 3, 71]) {
    print("\(bounds.min) \(bounds.max)")
}

func greet(person: String, from hometown: String) -> String {
    return "hello \(person), glad you could visit from \(hometown)"
}
func greet(person: String, to hometown: String = "beijing") -> String {
    return "hello \(person), glad you could come to \(hometown)"
}
greet(person: "bill", from: "Cupertino")
greet(person: "bill")
greet(person: "bill", to: "Cupertino")

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number;
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5, 6)
arithmeticMean(3, 8.25, 18.75)

func swap(_ a: inout Int, _ b: inout Int) { let t = a; a = b; b = t; }
var a = 1, b = 2; swap(&a, &b); print("\(a) \(b)")

func add(n1: Int, n2: Int) -> Int { return n1 + n2 }
//func add(first n1: Int, second n2: Int) -> Int { return n1 + n2 }
var addFunc: (Int, Int) -> Int = add;
addFunc(1, 2)

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("result: \(mathFunction(a, b))")
}
printMathResult(add, 3, 5)
printMathResult({(a, b) -> Int in return a + b}, 3, 7)
printMathResult({a, b in a + b}, 3, 7)
printMathResult({$0 + $1}, 3, 7)

func getMathFunc() -> (Int, Int) -> Int {
    func plus(a: Int, b: Int) -> Int { return a + b }
    return plus
}
getMathFunc()(7, 9)

var names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
names.sort { return $0 < $1 }
print(names)
//[&](int a, int b) -> int {return a + b;}
//(int a, int b) -> int {return a + b;}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

var incrementer8 = makeIncrementer(forIncrement: 8)
incrementer8()
incrementer8()

let incrementer5 = makeIncrementer(forIncrement: 5)
incrementer5()
incrementer5()

var anotherIncrementer = incrementer5
anotherIncrementer()
incrementer5()

var customerInLine: [String] = ["Barry", "Daniella", "Solina", "Joe", "Bill"]
var customerProviders: [() -> String] = []
func collectCustomerProvider(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProvider(customerInLine.remove(at: 0))
collectCustomerProvider(customerInLine.remove(at: 2))
print("collected \(customerProviders.count) closures")
for customerProvider in customerProviders {
    print("now serving \(customerProvider())")
}
print(customerInLine)

let nums = [1, 3, 5, 7, 9]
print(nums.map {$0 * 10})
print(nums.map {$0 > 4})
print(nums.reduce(100, {$0 + $1}))
print(nums.reduce(100) {$0 + $1})

let results = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
results.flatMap{$0.map{$0 * 10}}
results.flatMap{$0.filter{$0 > 5}}

let keys: [String?] = ["Zhangsan", nil, "Lisi", nil, "Wangwu"]
let validNames = keys.compactMap{ $0 }
print(validNames)
keys.compactMap{$0?.count}

let NON_WORDS: Set = ["the", "and", "of", "to", "a", "i", "it", "in", "or", "is", "as", "so", "but", "be"]
let words = """
There are moments in life when you miss someone so much that you just want to pick them from your dreams and hug them for real Dream what you want to dream go where you want to go be what you want to be because you have only one life and one chance to do all the things you want to do
"""
var wordDict: [String: Int] = [:]
let wordList = words.split(separator: " ")
wordList.map {$0.lowercased()}
    .filter {!NON_WORDS.contains($0)}
    .forEach{(word) in wordDict[word] = (wordDict[word] ?? 0) + 1}
print(wordList)

let source = "Hello world"
let target: [Character]  = ["a", "e", "i", "o", "u"]
zip(0..<source.count, source).forEach { (index, char) in
    if target.contains(char) {
        print(index)
    }
}

extension Array where Element: Any {
    func parallelMap<T>(_ transform: (Element) -> T) -> [T] {
        let n = self.count
        if n == 0 {return []}
        var result = ContiguousArray<T>()
        result.reserveCapacity(n)
        DispatchQueue.concurrentPerform(iterations: n, execute: {(i) in
            result.append(transform(self[i]))
        })
        return Array<T>(result)
    }

}

let employee = ["neal", "s", "stu", "j", "rich", "bob", "aiden", "j", "ethan", "liam", "mason", "noah", "lucas", "jacob", "jack"]
let cleanedNames = employee.filter { $0.count > 1}
    .parallelMap { $0.capitalized }
    .joined(separator: ", ")
print(cleanedNames)
