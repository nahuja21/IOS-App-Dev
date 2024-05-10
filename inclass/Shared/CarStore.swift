//
//  CarStore.swift
//  inclass
//
//  Created by Nikhil ahuja on 3/26/24.
//

import Foundation
import SwiftUI
import Combine

class CarStore : ObservableObject {
    @Published var cars: [Car]
    
    init (cars: [Car] = []) {
        self.cars = cars
    }
}
