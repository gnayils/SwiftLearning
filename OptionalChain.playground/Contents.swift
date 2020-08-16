import UIKit

class Room {
    let name: String
    init(name: String) {self.name = name}
}
class Address  {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber!) \(street!)"
        } else {
            return nil
        }
    }
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    var address: Address?
    subscript(i: Int) -> Room {
        get { return rooms[i]}
        set {rooms[i] = newValue}
    }
    func printNumberOfRooms() {
        print("the number of rooms is \(numberOfRooms)")
    }
}
class Person {
    var residence: Residence?
}

let john = Person()

if let roomCount = john.residence?.numberOfRooms {
    print("john's residence has \(roomCount) rooms")
} else {
    print("unable to retrieve the number of rooms")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

func createAddress() -> Address {
    print("function was called")
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}

john.residence?.address = createAddress()

if john.residence?.printNumberOfRooms() != nil {
    print("it was possible to print the number of rooms")
} else {
    print("it was not possible to print the number of rooms")
}

if (john.residence?.address = someAddress) != nil {
    print("it was possible to set the address")
} else {
    print("it was not possible to set the address")
}

if let firstRoomName = john.residence?[0].name {
    print("the first room name is \(firstRoomName)")
} else {
    print("unable to retrieve the first room name")
}

if let beginWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginWithThe {
        print("john's building identifier begins with \"The\"")
    } else {
        print("john's building identifier not begins with \"The\"")
    }
    
}
