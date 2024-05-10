//
//  ContentView.swift
//  Shared
//
//  Created by Nikhil ahuja on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var magnification: CGFloat = 1.0
    @GestureState private var offset: CGSize = .zero
    @GestureState private var longPress: Bool = false
    
    
    @State private var dragEnable: Bool = false
    
    var body: some View {
        
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 2.0).onEnded({_ in
            self.dragEnable = true})
            .sequenced(before: DragGesture())
            .updating($offset){
                value, state, transaction in
                switch value {
                case .first (true):
                    print ("Long press in progress")
                case . second (true, let drag):
                    state = drag?.translation ?? .zero
                default: break
                }
            }
            .onEnded({value in self.dragEnable = false})
        
        
        let tap = TapGesture (count: 2).onEnded{_ in print ("tapped")
        }
        
        let longPressAndDrag = LongPressGesture (minimumDuration: 2, maximumDistance: 25).updating($longPress){value, state, transition in state = value
        }
            .simultaneously(with: DragGesture())
            .updating($offset) {value, state, transition in state = value.second?.translation ?? .zero}
            //.onEnded{_ in print ("Long press")}
        
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0).onChanged({value in self.magnification = value
            print ("Magnifying")}).onEnded {_ in print ("Gesture Ended")}
        
        let drag = DragGesture ()
            .updating($offset){
                dragValue, state, transaction in state = dragValue.translation
            }
        
        Image(systemName: "hand.point.right.fill")
            .foregroundColor(dragEnable ? Color.green : Color.blue)
            //.resizable()
            //.font(.largeTitle)
            .offset(offset)
            .gesture(longPressBeforeDrag)
            .frame(width: 100, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
