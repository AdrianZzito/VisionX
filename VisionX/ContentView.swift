//
//  ContentView.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        TabView {
            
            LaunchesView()
                .tabItem { Label("Launches", image: "rocketLaunch") }
            
            RocketsView()
                .tabItem { Label("Rockets", systemImage: "flame.fill") }
            
            PadsView()
                .tabItem { Label("Launchpads", systemImage: "arrow.up.arrow.down") }
            
            /*
            StarlinkView()
                .tabItem { Label("Starlink", image: "satellite") }
            
            RoadsterView()
                .tabItem { Label("Roadster", systemImage: "car") }
             */
            
        }
        .environment(ViewModel())
        
    }
}
