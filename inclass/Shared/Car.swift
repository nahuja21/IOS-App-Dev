//
//  Car.swift
//  inclass
//
//  Created by Nikhil ahuja on 3/26/24.
//

import Foundation
import SwiftUI

struct Car : Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
    
}

