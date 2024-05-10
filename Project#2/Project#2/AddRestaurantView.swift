//
//  AddRestaurantView.swift
//  Project#2
//
//  Created by Nikhil ahuja on 4/1/24.
//

import Foundation
import SwiftUI

struct AddRestaurantView: View {
    @Binding var restaurants: [Restaurant]
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                //button to add restraunt to the array
                Button("Add") {
                    let newRestaurant = Restaurant(name: name, description: description)
                    restaurants.append(newRestaurant)
                    presentationMode.wrappedValue.dismiss()
                }
                //Add becomes enabeled once description is wrote
                .disabled(name.isEmpty || description.isEmpty)
            }
            //sets title
            .navigationBarTitle("Add Restaurant", displayMode: .inline)
        }
    }
}
