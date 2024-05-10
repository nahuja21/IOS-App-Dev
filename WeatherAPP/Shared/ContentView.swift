//
//  ContentView.swift
//  Shared
//
//  Created by Nikhil ahuja on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel ()
    
    var body: some View {
        NavigationView {
            VStack{
                Text (viewModel.description)
                Text(viewModel.timeZone)
                Text(viewModel.temperature)
                Text(viewModel.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
