//
//  LaunchesView.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

struct LaunchesView: View {
    
    @Environment(ViewModel.self) var viewModel
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        
        var searchingResults: [LaunchElement] {
            viewModel.launches.filter { $0.name.contains(searchText) }
        }
        
        NavigationSplitView {
            
            List {
                
                ForEach(isSearching ? searchingResults : viewModel.launches, id: \.self) { launch in
                    NavigationLink(value: launch) {
                        LaunchRowView(launch: launch)
                    }
                }
                
            }
            .navigationTitle("Launches")
            .navigationDestination(for: LaunchElement.self) { launch in
                LaunchDetailView(launch: launch)
            }
            
        } detail: {
            
            if let launch = viewModel.launches.first {
                LaunchDetailView(launch: launch)
            }
            
        }
        .onAppear {
            Task {
                await viewModel.getLaunches()
            }
        }
        .searchable(text: $searchText, isPresented: $isSearching, prompt: "Search for a launch")
        
    }
}

#Preview {
    LaunchesView()
        .environment(ViewModel())
}
