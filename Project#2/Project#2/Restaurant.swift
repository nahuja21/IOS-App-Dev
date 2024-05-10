//
//  Restaurant.swift
//  Project#2
//
//  Created by Nikhil ahuja on 4/1/24.
//

import Foundation

struct Restaurant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
}
