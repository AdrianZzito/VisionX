//
//  RocketsView.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

struct RocketsView: View {
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                ForEach(viewModel.rockets, id: \.self) { rocket in
                    NavigationLink(value: rocket) {
                        Text(rocket.name)
                    }
                }
            }
            .navigationTitle("Rockets")
            .navigationDestination(for: Rocket.self) { rocket in
                RocketDetailView(rocket: rocket)
            }
            
        } detail: {
            if let rocket = viewModel.rockets.first {
                RocketDetailView(rocket: rocket)
            }
        }
        .onAppear {
            Task {
                await viewModel.getRockets()
            }
        }
        
    }
}

#Preview {
    RocketsView()
        .environment(ViewModel())
}
