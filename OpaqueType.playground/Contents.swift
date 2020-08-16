import UIKit

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length  in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

struct Square: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for _ in 1...size {
            result.append(String(repeating: "*", count: size))
        }
        return result.joined(separator: "\n")
    }
}

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let result = shape.draw().split(separator: "\n")
        return result.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}


//func makeTapezoid() -> JoinedShape<Triangle, JoinedShape<Square, FlippedShape<Triangle>>> {
//func makeTapezoid() -> some Shape {
func makeTapezoid(size: Int) -> some Shape {
    let t = Triangle(size: size)
    let s = Square(size: size)
    let f = FlippedShape(shape: t)
    return JoinedShape(top: t, bottom: JoinedShape(top: s, bottom: f))
}

print(makeTapezoid(size: 4).draw())


protocol Container {
    associatedtype Item
    var count: Int {get}
    subscript(index: Int) -> Item {get}
}

extension Array: Container { }

func makeContainer<T>(items: T...) -> some Container {
    var a = Array<T>()
    a.append(contentsOf: items)
    return a
}

let c = makeContainer(items: 1, 2, 4, 5)
print(c)

