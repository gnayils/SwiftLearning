//
//  CircleImage.swift
//  Landmarks
//
//  Created by Yang Li on 2020/7/19.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("ymy").clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
