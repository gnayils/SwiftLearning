import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {

        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    defer { print("end vending")}
    print("begin vendnig")
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum")
} catch VendingMachineError.invalidSelection {
    print("invalid selection")
} catch VendingMachineError.outOfStock {
    print("out of stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("insufficient funds, please insert an additional \(coinsNeeded) coins")
} catch {
    print("Unexpected error: \(error)")
}

enum SomeError : Error {
    case error1
    case error2
}

func someThrowingFunction() throws -> Int {
    if true { throw SomeError.error1 }
    return 1
}

let r = try? someThrowingFunction()

func anotherThrowingFunction() throws -> Int {
    if false { throw SomeError.error1 }
    return 1
}

let x = try! anotherThrowingFunction()
