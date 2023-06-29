//
//  LaunchpadView.swift
//  VisionX
//
//  Created by Adrián Castilla on 29/6/23.
//

import SwiftUI

struct PadsView: View {
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                
                Section("Launchpads") {
                    ForEach(viewModel.launchpads, id: \.self) { launchpad in
                        NavigationLink(value: launchpad) {
                            Text(launchpad.name)
                        }
                    }
                }
                
                Section("Landpads") {
                    ForEach(viewModel.landpads, id: \.self) { landpad in
                        NavigationLink(value: landpad) {
                            Text(landpad.name)
                        }
                    }
                }
                
            }
            .navigationTitle("Pads")
            .navigationDestination(for: Launchpad.self) { launchpad in
                LaunchpadDetailView(launchpad: launchpad)
            }
            .navigationDestination(for: Landpad.self) { landpad in
                LandpadDetailView(landpad: landpad)
            }
            
        } detail: {
            if let launchpad = viewModel.launchpads.first {
                LaunchpadDetailView(launchpad: launchpad)
            }
        }
        .onAppear {
            Task {
                await viewModel.getLaunchpads()
                await viewModel.getLandpads()
            }
        }
        
    }
}

#Preview {
    PadsView()
        .environment(ViewModel())
}
