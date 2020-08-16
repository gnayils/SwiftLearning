//
//  PropertyWrapperView.swift
//  Landmarks
//
//  Created by Yang Li on 2020/7/19.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import SwiftUI

@propertyWrapper
struct UserDefaultsWrapper<T> {
    var wrappedValue: T {
        get { return UserDefaults.standard.value(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key)}
    }
    var key: String
    var defaultValue: T
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

struct PropertyWrapperView: View {
    
    @UserDefaultsWrapper("hadShownUserGuide", defaultValue: false)
    static var hadShownUserGuide: Bool
    
    @State
    private var showText = hadShownUserGuide ? "already shown" : "not shown yet"
    
    var body: some View {
        Button(action: {
            if !PropertyWrapperView.hadShownUserGuide {
                PropertyWrapperView.hadShownUserGuide = true
                self.showText = "already shown"
            }
        }) {
            Text(self.showText)
        }
    }
}

struct PropertyWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperView()
    }
}
