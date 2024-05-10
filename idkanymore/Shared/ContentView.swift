//
//  ContentView.swift
//  Shared
//
//  Created by Nikhil ahuja on 4/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    
    @State private var visibility = false
    
    var body: some View {
        VStack {
            Toggle (isOn: $visibility.animation(.linear (duration:1))){
                Text ("Toggle Text Views")
            }.padding()
            if visibility {
                Text ("Hello !!")
                    .font(.largeTitle)
            }
                if !visibility {
                Text ("Bye!!")
                    .font(.largeTitle)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
