//
//  RestaurantDetailView.swift
//  Project#2
//
//  Created by Nikhil ahuja on 4/1/24.
//

import Foundation
import SwiftUI
struct RestaurantDetailView: View {
    var restaurant: Restaurant //display detailed passed from the parent
    @State private var textColor = Color.black //for changing the text color back

    var body: some View {
        //vstack to allign everything
        VStack(alignment: .leading) {
            Text(restaurant.name)
                .font(.largeTitle)
                .foregroundColor(textColor)
            Text(restaurant.description)
                .font(.body)
            //pushes all content to the top
            Spacer()
            Button("Change Text Color") {
                textColor = textColor == .black ? .red : .black
            }
        }
        .padding()
    }
}
