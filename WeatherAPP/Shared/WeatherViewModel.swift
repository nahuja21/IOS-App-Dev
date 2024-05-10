//
//  WeatherViewModel.swift
//  WeatherAPP
//
//  Created by Nikhil ahuja on 5/2/24.
//

import Foundation

//Data needed by the view

class WeatherViewModel: ObservableObject {
    //Everytime this is updated the view will be updated
    
    @Published var title: String = "-"
    @Published var description: String = "-"
    @Published var temperature: String = "-"
    @Published var timeZone: String = "-"
    
    init(){
        fetchWeather ()
    }
    
    func fetchWeather (){
            guard let url = URL(string: "") else {
                return
            }
        let task = URLSession.shared.dataTask
        }
    }
    
    
