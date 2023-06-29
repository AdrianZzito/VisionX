//
//  LaunchRowView.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

struct LaunchRowView: View {
    
    let launch: LaunchElement
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(launch.name)
                    .font(.title)
                    .bold()
                
                Text(viewModel.launchRocket!.name)
                    .font(.subheadline)
                
            }
            
            if let patch = launch.links.patch.small {
                AsyncImage(url: URL(string: patch)) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    Image(systemName: "photo")
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            
        }
        .onAppear {
            Task {
                await viewModel.getSpecificRocket(rocketID: launch.rocket)
            }
        }
        
    }
}
