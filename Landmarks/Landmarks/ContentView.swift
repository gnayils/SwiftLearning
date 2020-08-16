//
//  ContentView.swift
//  Landmarks
//
//  Created by Yang Li on 2020/7/19.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().edgesIgnoringSafeArea(.all).frame(height: 300)
            CircleImage().offset(y: -100).padding(.bottom, -100)
            VStack (alignment: .leading) {
                Text("Old Summer Palace").font(.title)
                HStack {
                    Text("Royal Garden").font(.subheadline)
                    Spacer()
                    Text("Beijing").font(.subheadline)
                }
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
