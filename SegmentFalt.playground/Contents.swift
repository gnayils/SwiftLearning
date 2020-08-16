import UIKit


var stepSize = 1
func increment(_ number: inout Int) { number += stepSize }
increment(&stepSize)


struct Player {
    static let MAX_HEALTH = 10
    
    var name: String
    var health: Int
    var energy: Int
    
    init(name: String, health: Int, energy: Int) {
        self.name = name
        self.health = health
        self.energy = energy
    }

    mutating func restoreHealth() {
        health = Player.MAX_HEALTH
    }
}

func balance(_ health1: inout Int, _ health2: inout Int) {
    let total = health1 + health2
    health1 = total / 2
    health2 = health1
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&health, &teammate.health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 6, energy: 10)
//oscar.shareHealth(with: &oscar)
print("\(oscar.health) vs \(maria.health)")
