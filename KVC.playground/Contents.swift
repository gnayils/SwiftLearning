import UIKit

struct ValueType {
    var name: String
}
var object = ValueType(name: "Objective-C")
let name = \ValueType.name
object[keyPath: name] = "swift"
let valueOfName = object[keyPath: name]
print(valueOfName)

class Teacher {
    var age = 0
    var name = ""
}

let teacher = Teacher()
teacher[keyPath: \Teacher.name] = "zhangsan"
let teacherName = teacher[keyPath: \Teacher.name]

class Person: NSObject {
    @objc dynamic var age = 0
}

class KVO: NSObject {
    
    @objc dynamic let p = Person()
    var ob: NSKeyValueObservation?
    
    override init() {
        super.init()
        p.addObserver(self, forKeyPath: "age", options: [.new, .old], context: nil)
        ob = observe(\.p.age, options: [.new, .old], changeHandler: {(_, change) in
            print(change.newValue as Any)
        })
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "age" {
            print("age value has been changed")
            print(change as Any)
        }
    }
}

let kvo = KVO()
kvo.p.age = 5
