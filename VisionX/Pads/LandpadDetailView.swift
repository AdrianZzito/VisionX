//
//  LandpadDetailView.swift
//  VisionX
//
//  Created by Adrián Castilla on 29/6/23.
//

import SwiftUI

struct LandpadDetailView: View {
    
    let landpad: Landpad
    
    @State var navigation = false
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        let activityColor = switch landpad.status {
        case "active": Color.green
        case "retired": Color.red
        case "under construction": Color.yellow
        default: Color.gray
        }
        
        VStack {
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text(landpad.fullName)
                        .font(.title)
                        .bold()
                    
                    Label(landpad.locality, systemImage: "location.magnifyingglass")
                    
                    HStack {
                        Circle()
                            .foregroundStyle(activityColor)
                            .frame(width: 15, height: 15)
                        Text(landpad.status.capitalized)
                    }
                    
                    HStack {
                        Label("\(landpad.landingSuccesses)", systemImage: "checkmark.seal")
                            .foregroundStyle(.green)
                            .help("Landing successes")
                    }
                    
                    HStack {
                        Label("\(landpad.landingAttempts)", systemImage: "arrow.down")
                            .help("Landing attempts")
                    }
                    
                }

                ForEach(landpad.images.large, id: \.self) { image in
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
            
            if landpad.launches.isEmpty == false {
                Section("Launches") {
                    ScrollView() {
                        
                        ForEach(viewModel.launchesOnLaunchpad, id: \.self) { launches in
                            NavigationLink(value: launches) {
                                LaunchRowView(launch: launches)
                            }
                        }
                        
                    }
                }
            }
            
        }
        .navigationTitle(landpad.name)
        .onChange(of: landpad) {
            Task {
                await viewModel.getSpecificLaunch(launches: landpad.launches)
            }
        }
        
    }
    
}
