//
//  LaunchDetailView.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

struct LaunchDetailView: View {
    
    let launch: LaunchElement
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                if let patch = launch.links.patch.large {
                    AsyncImage(url: URL(string: patch)) { image in
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Image(systemName: "photo")
                    }
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                
                VStack(alignment: .leading) {
                    Text(launch.name)
                        .font(.title)
                        .bold()
                    
                    if let videoID = launch.links.youtubeID {
                        YoutubeView(videoId: videoID)
                            .frame(width: 400, height: 250)
                            .shadow(radius: 10)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                }
                
            }
            
            Section("Details") {
                
                Form {
                    
                    Text("Flight number: \(launch.flightNumber)")
                    
                    if let details = launch.details {
                        Text("Launch details: \(details)")
                    }
                    
                    if let failures = launch.failures.first?.reason {
                        Text("Failure: \(failures)")
                    }
                    
                }
                
            }
            
        }
        .navigationTitle(launch.name)
        .padding()
        
    }
}
