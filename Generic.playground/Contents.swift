import UIKit

func swap<T>(_ a: inout T, _ b: inout T) {
    let temp = a;
    a = b;
    b = temp;
}

var ai: Int = 0, bi: Int = 1
swap(&ai, &bi)
var ad: Double = 0.0, bd: Double = 1.0
swap(&ad, &bd)

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) { items.append(item) }
    mutating func pop() -> Element { return items.removeLast() }
}

var stringStack = Stack<String>()
stringStack.push("one")
stringStack.push("two")
stringStack.push("three")
stringStack.pop()

extension Stack {
    var top: Element? { return items.isEmpty ? nil : items[items.count - 1] }
    func peekTop() -> Element? { return top }
}
stringStack.peekTop()

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind { return index }
    }
    return nil
}

findIndex(of: "two", in: stringStack.items)

protocol Container {
    associatedtype ItemType
    var count: Int {get}
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType {get}
}

extension Stack: Container {
    typealias ItemType = Element
    var count: Int {return items.count}
    mutating func append(_ item: ItemType) { self.push(item) }
    subscript(i: Int) -> ItemType { return items[i] }
}

stringStack.count
stringStack[0]


protocol EquableContainer {
    associatedtype ItemType: Equatable
    var count: Int {get}
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType {get}
}

protocol SuffixableContainer: Container {
    associatedtype SuffixType: SuffixableContainer where SuffixType.ItemType == ItemType
    func suffix(_ size: Int) -> SuffixType;
}

protocol IterableContainer: Container {
    associatedtype Iterator: IteratorProtocol where Iterator.Element == ItemType
    func makeIterator() -> Iterator
}

func allItemMatch<C1: Container, C2: Container>(_ c1: C1, _ c2: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    if c1.count != c2.count { return false }
    for i in 0..<c1.count { if c1[i] != c2[i] { return false } }
    return true;
}


extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [ItemType] where Indices.Iterator.Element == Int {
        var result = [ItemType]()
        for index in indices { result.append(self[index]) }
        return  result;
    }
}

var intArray = Stack<Int>()
intArray.append(0)
intArray.append(1)
intArray.append(2)
intArray.append(3)
print(intArray[[1, 3]])
 
