//
//  Human.swift
//  Bundle
//
//  Created by Yang Li on 2020/7/21.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import Foundation

private class Human {
    
    var name: String
    var age: Int
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    class Gender {
        
    }
}

fileprivate class Teacher: Human.Gender {
    
}
