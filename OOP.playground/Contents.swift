import UIKit

enum CompassPoint : CaseIterable {
    case north, south, east, west
}

let direction = CompassPoint.south
switch  direction {
case .north:
    print("lots of planets have a north")
case .south:
    print("watch out for penguins")
case .east:
    print("where the sun rises")
case .west:
    print("where the skies are blue")
}

print(CompassPoint.allCases.count)
for direction in CompassPoint.allCases {
    print(direction)
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarCode = Barcode.upc(8, 85909, 51226, 3)
print(productBarCode)
productBarCode = .qrCode("ABCDEFGHIJKLMNOP")
print(productBarCode)
switch productBarCode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem) \(manufacturer) \(product) \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}
    
enum ASCIICtrlChar : Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Plant: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Plant {
        return Plant(rawValue: n)!
    }
}
print(Plant[4])

enum CompassDirection: String {
    case north, south, east, west
}

let possiblePlant = Plant(rawValue: 7)
let positionToFind = 11
if let somePlant = Plant(rawValue: positionToFind) {
    switch somePlant {
    case .earth:
        print("mostly harmless")
    default:
       print("not a safe place for humans")
    }
} else {
    print("there isn't a planet at position \(positionToFind) ")
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5);
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.addition(sum, ArithmeticExpression.number(2))
print(product)

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) + evaluate(right)
    }
}
print(evaluate(product))

class DataImporter {
    var file = "file.txt"
    init() {
        print("DataImporter init")
    }
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager();
manager.data.append("some data")
manager.data.append("some more data")
print("manager.data.append finish")
print(manager.importer.file)

struct Point { var x = 0.0, y = 0.0 }
struct Size {var width = 0.0, height = 0.0}

struct Rect {
    var origin = Point();
    var size = Size();
    var center: Point {
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
        get {
            Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
    
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

class SetupCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("about to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = SetupCounter()
stepCounter.totalSteps = 100
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300
stepCounter.totalSteps = 400

var count: Int = 0 {
    willSet { print("about to set count to \(newValue)") }
    didSet { if count > oldValue { print("added \(count - oldValue) to count") }}
}
count = 10

class SomeClass {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

struct P {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX; y += deltaY
    }
    mutating func jumpBy(x deltaX: Double, y deltaY: Double) {
        self = P(x: x + deltaX, y: y + deltaY)
    }
}
var sp = P(x: 1.0, y: 1.0)
sp.moveBy(x: 2.0, y: 3.0)
sp.jumpBy(x: 2.0, y: 3.0)

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

class ParentClass {
    func funcA() {
        print("ParentClass::funcA")
    }
    static func funcB() {
        print("ParentClass::funcB")
    }
    class func funcC() {
        print("ParentClass::funcB")
    }
}

class ChildClass : ParentClass {
    override func funcA() {
       print("ChildClass::funcA")
    }
    func funcB() {
       print("ChildClass::funcB")
    }
}

let pc: ParentClass = ChildClass()
pc.funcA()
ParentClass.funcB()
ParentClass.funcC()

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[6]

struct Matrix {
    let rows: Int, cols: Int
    var grid: [Double]
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
        grid = Array(repeating: 0.0, count: rows * cols)
    }
    func indexIsValid(row: Int, col: Int) -> Bool {
        return row >= 0 && row < rows && col >= 0 && col < cols
    }
    
    subscript(row: Int, col: Int) -> Double {
        get {
            assert(indexIsValid(row: row, col: col), "index out of range")
            return grid[(row * cols) + col]
        }
        set {
            assert(indexIsValid(row: row, col: col), "index out of range")
            return grid[(row * cols) + col] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, cols: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

class ShoppingListItem {
    
    let mall: String?
    var name: String?
    var quantity = 1
    var purchased: Bool;
    
    init() { purchased = false; mall = "jingdong" }
    init(n name: String, q quantity: Int, p purchased: Bool) {
        self.name = name
        self.quantity = quantity
        self.purchased = purchased
        self.mall = "jingdong"
    }
    
}
print(ShoppingListItem().purchased)
print(ShoppingListItem(n: "book", q: 1, p: true).purchased)

class Person {
    var name: String
    var age : Int
    init(name: String, age: Int) {
        self.name = name;
        self.age = age;
        f()
    }
    convenience init()  {
        self.init(name: "[Unnamed]", age: 0)
    }
    
    func f() {
        print("leave Person init()")
    }
    deinit {
        print("deinit Persion")
    }
}

class Teacher : Person {
    var salary: Int

    init?(name: String, age: Int, salary: Int) {
        if age < 18 || 100 < age { return nil}
        print("enter Teacher init()")
        self.salary = salary
        super.init(name: name, age: age)
        print(self.name)
        test()
        self.name = name + "Teacher"
    }
    
    convenience init?(name: String) {
        self.init(name: name, age: 30, salary: 5000)
        self.name = "Teacher"
    }
    
    deinit {
        print("deinit Teacher")
    }
    

    func test() {
        print("i am a test")
    }
    
    func showInfo() {
        print("teacher name \(name), age: \(age), salary: \(salary)")
    }
    
}
let t = Teacher(name: "kevin")
let t2 = Teacher(name: "jerry", age: 9, salary: 5000)
print(t2?.showInfo())

class Vehicle {
    var speed: Int = 0;
    var description: String {
        return "the vehicle running at speed: \(speed)"
    }
    func makeNoise() {}
}

class Car: Vehicle {
    var gear = 1
    override var speed: Int {
        get { 50 * gear }
        set { gear = newValue / 50}
    }
    override var description: String {
        return super.description + " in gear \(gear)"
    }
    override func makeNoise() {
        print("wong~~~~~~")
    }
}
let car = Car()
car.gear = 3;
car.description
car.makeNoise()

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name;
    }
}

class Movie: MediaItem {
    var director:String
    init(name:String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    var ic: InnerClass
    init(name:String, artist: String) {
        self.artist = artist
        self.ic = InnerClass()
        super.init(name: name)
    }
    
    class InnerClass {
        var variable: String = "default  "
    }
}

let library =  [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist:  "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One and Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give you up", artist: "Rick Astley")
]
print(type(of: library))

for l in library  {
    if l is Movie {
        let m: Movie = l as! Movie
        print(m.director)
    }
    print((l as? Song)?.artist)
    print((l as? Song)?.ic.variable)
}


extension Double {
    var km: Double {return self * 1000.0}
    var m: Double {return self }
    var cm: Double {return self / 100}
}
25.4.km; 1000.m; 100.cm

extension Rect {
    init(x: Double, y: Double, width: Double, height: Double) {
        self.init(origin: Point(x: x, y: y), size: Size(width: width, height: height))
    }
}
let r = Rect(x: 1.0, y: 2.0, width: 3.0, height: 4.0)

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("hello")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}
var varInt = 3
varInt.square()

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

12345678[0]
12345678[1]
12345678[2]
12345678[3]

extension Int {
    enum Kind { case negative, zero, positive }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
(-1).kind
0.kind
(+1).kind

protocol FullyNamed { var fullName: String {get} }

struct Individual: FullyNamed { var fullName: String }
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

let john = Individual(fullName: "John Appleseed")
let ncc1701 = Starship(name: "Enterprise", prefix: "USS")

protocol Named { var name: String {get} }
protocol Aged { var age: Int {get }}
struct Man: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("happy birthday, \(celebrator.name), you're \(celebrator.age)")
}
let birthdayPerson = Man(name: "malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

protocol TextRepresentable { var textualDesc: String {get} }
struct Hamster {
    var name: String
    var textualDesc: String { return "A hamster named \(name)" }
}
extension Hamster: TextRepresentable {}
extension Collection where Iterator.Element: TextRepresentable {
    var textualDesc: String {
        let itemsAsText = self.map{$0.textualDesc}
        return "[" + itemsAsText.joined(separator: ", ") + "]@collection"
    }
}
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDesc: String {
        let itemsAsText = self.map{$0.textualDesc}
        return "[" + itemsAsText.joined(separator: ", ") + "]@array"
    }
}
let hamsters = [Hamster(name: "a"), Hamster(name: "b")]
print(hamsters.textualDesc)

extension RandomNumberGenerator {
    mutating func randomBool() -> Bool { return next() > UInt64.max / 2 }
}

var generator = SystemRandomNumberGenerator()
print(generator.next())
print(generator.randomBool())

