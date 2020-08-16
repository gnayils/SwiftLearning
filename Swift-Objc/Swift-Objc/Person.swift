//
//  Person.swift
//  Swift-Objc
//
//  Created by Yang Li on 2020/8/5.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import Foundation

class Person : NSObject {
    
    @objc var name: String
    @objc var age: Int
    
    @objc init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
