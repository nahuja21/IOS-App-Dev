//
//  RestaurantsListView.swift
//  Project#2
//
//  Created by Nikhil ahuja on 4/1/24.
//

import Foundation
import SwiftUI
struct RestaurantsListView: View {
    @State private var restaurants = [Restaurant]() //list of restraunts
    @State private var showingAddRestaurant = false //shows wether add restraunt is visible or not

    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                        //displays restraunt name
                        Text(restaurant.name)
                    }
                }
                //ability to delete and move restraunts in the list
                .onDelete(perform: deleteRestaurants)
                .onMove(perform: moveRestaurants)
            }
            //bar title
            .navigationBarTitle("Restaurants")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                showingAddRestaurant = true
            }) {
                Image(systemName: "plus")
            })
            //displays the add restraunt view as a sheet when showingAddRestaurant == true
            .sheet(isPresented: $showingAddRestaurant) {
                AddRestaurantView(restaurants: $restaurants)
            }
        }
    }
    //function to delete from the list
    func deleteRestaurants(at offsets: IndexSet) {
        restaurants.remove(atOffsets: offsets)
    }
    //function to rearrange on the list
    func moveRestaurants(from source: IndexSet, to destination: Int) {
        restaurants.move(fromOffsets: source, toOffset: destination)
    }
}
