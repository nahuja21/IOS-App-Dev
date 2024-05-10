//
//  ContentView.swift
//  Shared
//
//  Created by Nikhil ahuja on 3/26/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var carStore: CarStore = CarStore (cars: carData)
    
    var body: some View {
        List {
            ForEach (carStore.cars) { car in
                HStack {
                    ListCell(car: car)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View{
    var car:Car
    var body: some View {
        NavigationLink (destination: CarDetail (selectedCar: car)){
        HStack {
            Image (car.imageName)
                .resizable()
                .aspectRatio (contentMode: .fit)
                .frame(width: 100, height: 60)
            
            Text (car.name)
        }
        }
    }
}

