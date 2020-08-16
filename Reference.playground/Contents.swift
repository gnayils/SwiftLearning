import UIKit

class Person {
    let name: String
    init (name: String) {self.name = name}
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) {self.unit = unit}
    weak var tenant: Person?
    deinit { print("apartment \(unit) is being deinitialized") }
}

var p = Person(name: "John")
var a = Apartment(unit: "302")

p.apartment = a
a.tenant = p

class Country {
    let name: String
    var capitalCity: City!
    lazy var closure = {
        [unowned self, weak city = self.capitalCity]
        (index: Int, text: String) -> String in
        return text
    }
    init(name: String, capitalName: String) {
        self.name = name
        
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
