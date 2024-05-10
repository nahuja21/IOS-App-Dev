//
//  ContentView.swift
//  Shared
//
//  Created by Nikhil ahuja on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack (alignment: .crossAlignment, spacing: 20){
            Circle()
                .foregroundColor(Color.purple) .frame(width: 100, height: 100)
                .alignmentGuide(.crossAlignment, computeValue: {d in d[VerticalAlignment.top]})
            Rectangle()
                .foregroundColor(Color.green) .frame(width: 100, height: 100)
            Rectangle()
                .foregroundColor(Color.red) .frame(width: 100, height: 100)
            Rectangle()
                .foregroundColor(Color.blue)
                .alignmentGuide(.crossAlignment, computeValue: {d in d[VerticalAlignment.top]})
                .frame(width: 100, height: 100)
            Rectangle()
                .foregroundColor(Color.yellow) .frame(width: 100, height: 100)
        }
        .padding()
    }
}

extension VerticalAlignment {
    private enum OneThird: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height/3
        }
        
    }
    static let oneThird = VerticalAlignment (OneThird.self)
}

extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        
        static func defaultValue (in d: ViewDimensions) -> CGFloat {
            return d [.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
