//
//  LaunchpadDetailView.swift
//  VisionX
//
//  Created by Adrián Castilla on 29/6/23.
//

import SwiftUI

struct LaunchpadDetailView: View {
    
    let launchpad: Launchpad
    
    @State var navigation = false
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        let activityColor = switch launchpad.status {
        case "active": Color.green
        case "retired": Color.red
        case "under construction": Color.yellow
        default: Color.gray
        }
        
        VStack {
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text(launchpad.fullName)
                        .font(.title)
                        .bold()
                    
                    Label(launchpad.locality, systemImage: "location.magnifyingglass")
                    
                    HStack {
                        Circle()
                            .foregroundStyle(activityColor)
                            .frame(width: 15, height: 15)
                        Text(launchpad.status.capitalized)
                    }
                    
                    HStack {
                        Label("\(launchpad.launchSuccesses)", systemImage: "checkmark.seal")
                            .foregroundStyle(.green)
                            .help("Launch successes")
                    }
                    
                    HStack {
                        Label("\(launchpad.launchAttempts)", systemImage: "arrow.up")
                            .help("Launch attempts")
                    }
                    
                }

                ForEach(launchpad.images.large, id: \.self) { image in
                    AsyncImage(url: URL(string: image)) { image in
                        image
                            .resizable()
                            .frame(width: 200, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                
            }
            
            Divider()
            
            if launchpad.launches.isEmpty == false {
                Section("Launches") {
                    List {
                        ForEach(viewModel.launchesOnLaunchpad, id: \.self) { launches in
                            LaunchRowView(launch: launches)
                        }
                    }
                }
            }
            
        }
        .navigationTitle(launchpad.name)
        .onChange(of: launchpad) {
            Task {
                await viewModel.getSpecificLaunch(launches: launchpad.launches)
            }
        }
        
    }
}

