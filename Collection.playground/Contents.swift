import UIKit

var myArray = [1, 3, 5, 7]
var myArray2:[Int] = []
var myArray3 = [Int]()
var myArray9 = [Int](0...7)
var myArray4:[Int] = [Int]()
var myArray5 = Array<Int>()
var myArray10 = Array<Int>(1...9)
var myArray6 = Array<Int>(repeating: 0, count: 5)
let persons = ["zhangsa": 27, "lisi": 28, "wangwu": 29]
var myArray8 = [Int](persons.values)

let numbers = [Int](2...7)
for (i, n) in numbers.enumerated(){
    print("index: \(i), value: \(n)")
}
for i in numbers.indices {
    print(numbers[i])
}
var numbersIterator = numbers.makeIterator()
while let n = numbersIterator.next() {
    print(n)
}
numbers.forEach { (n) in
    if n == 3 {
        print("has number 3")
    }
}

var array = [10, 20, 45, 30, 98, 101, 30, 4]
array.allSatisfy{$0 > 10}
array.contains(20)
array.first
array.last
array.first(where: {$0 > 25})
array.last(where: {$0 > 25})
array.firstIndex(of: 30)
array.lastIndex(of: 30)
array.firstIndex(where: {$0 > 25})
array.lastIndex(where: {$0 > 25})
array.min()
array.max()
var tupleArray = [(45, "error1"), (23, "error2"), (30, "error3")]
tupleArray.min {a, b in a.0 < b.0}
tupleArray.max {a, b in a.0 < b.0}
array.append(100)
array.append(contentsOf: 101...105)
array.insert(-1, at:0)
array.insert(contentsOf: -2...0, at: 0)

var arraySlice = array.dropFirst()
arraySlice = array.dropFirst(3)
arraySlice = array.dropLast()
arraySlice = array.dropLast(3)
arraySlice = array.drop {$0 < 15}
arraySlice = array.prefix(4)
arraySlice = array.prefix(upTo: 4)
arraySlice = array.prefix(through: 4)
arraySlice = array.prefix { $0 < 10}
arraySlice = array.suffix(3)
arraySlice = array.suffix(from: 3)
arraySlice = array[1...2]
arraySlice = array[0..<2]
arraySlice = array[..<2]
arraySlice = array[...2]
arraySlice = array[2...]
arraySlice = array[...]
var array2 = Array(arraySlice)

array.remove(at: 1)
array.removeFirst()
array.removeLast()
array.removeFirst(2)
array.removeLast(3)
array.removeSubrange(2...5)
array.removeAll(keepingCapacity: true)
array.capacity
array.removeAll()
array.capacity

var arr1 = [1, 2, 3, 4, 5]
var arr2 = arr1[...2]
arr1.insert(0, at: 0)
arr2.insert(0, at: 0)

var array3 = [Int](1...8)
array3.shuffle()
array3.shuffled()
array3.reverse()
array3.reversed()
let pos = array3.partition { (ele) -> Bool in ele > 5}
array3[..<pos]
array3[pos...]
array3.sort()
array3.sorted()
array3.swapAt(array3.startIndex, array3.endIndex - 1)

var array4 = ["hello", "world"]
array4.joined()
array4.joined(separator: ", ")

let ranges = [0..<3, 8..<10, 15..<17]
for range in ranges { print(range) }
for i in ranges.joined() { print(i) }

let nestedNumbers = [[1, 3, 5, 7], [2, 4, 6, 8]]
nestedNumbers.joined(separator: [-1, -2])

struct Stack<T> {
    private var elements = [T]()
    var count: Int {return elements.count}
    var isEmpty: Bool {return elements.isEmpty}
    var peek: T?  {return elements.last}
    mutating func push(_ element: T) { elements.append(element) }
    mutating func pop() -> T? { return elements.popLast()}
}

var stack = Stack<Int>()
stack.push(1)
stack.push(3)
stack.push(8)
stack.pop()
stack.count

struct Queue<T> {
    private var elements: [T] = []
    var count: Int { return elements.count }
    var isEmpty: Bool { return elements.isEmpty }
    var peek: T? { return elements.first }
    mutating func enqueue(_ element: T) { elements.append(element) }
    mutating func dequeue() -> T? { return isEmpty ? nil : elements.removeFirst() }
}
var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(3)
queue.enqueue(8)
queue.dequeue()
queue.count

var set: Set<String> = ["Math", "English", "History"]
set.insert("History")
set.sorted()
set.count
set.isEmpty

struct Person : Hashable {
    var name: String
    var age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

var pSet = Set<Person>();
pSet.insert(Person(name: "zhangesan", age: 17))
pSet.update(with: Person(name: "zhangsan", age: 27))
pSet.update(with: Person(name: "wangwu", age: 37))
print(pSet.filter {$0.age > 27})
pSet.remove(Person(name:"zhangsan", age: 27))
pSet.removeFirst()

var set1: Set<Int> = [1, 2, 3, 4, 5]
var set2: Set<Int> = [4, 5, 6, 7, 8]
set1.intersection(set2)
set1.union(set2)
set1.symmetricDifference(set2)
set1.subtract(set2)
var set3: Set<Int> = [1, 2, 3, 4, 5]
var set4: Set<Int> = [2, 3, 4]
set4.isSubset(of: set3)
set3.isSuperset(of: set4)
set4.isStrictSubset(of: set3)
set3.isStrictSuperset(of: set4)
set3.isDisjoint(with: set4)

var dict1 = Dictionary<String, Int>()
var dict2 = [String: Int]()
var dict3: Dictionary<String, Int> = [:]

var dict = ["zhangsan": 18, "lisi": 19, "wangwu": 20]
dict.count
dict.isEmpty
for (k, v) in dict { print("\(k): \(v)") }
for k in dict.keys.sorted() { print("\(k)") }
dict.updateValue(29, forKey: "lisi")
dict.updateValue(39, forKey: "zhaoliu")
dict["zhansan"] = 12
dict["dingyi"] = 22
dict.count
dict.merge(["a": 1, "b": 2], uniquingKeysWith: {(current, _) in current})
dict.merge(["a": 2, "b": 4], uniquingKeysWith: {(_, new) in new})
let fi = dict.firstIndex(where: {($0.value > 18)})
if let index = fi { print(dict[index].value) }
let recordTimes: KeyValuePairs = ["a": 1, "b": 2, "c": 3]
recordTimes.first
recordTimes.last
