//
//  RoadsterView.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI
import RealityKit
import Roadster

struct RoadsterView: View {
    
    @Environment(ViewModel.self) var viewModel
    
    @State var showingImmersiveSpace = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        
        TimelineView(.animation) { context in
            VStack {
                
                Text(viewModel.roadsterDetails!.name)
                    .font(.title)
                    .bold()
                
                Text(viewModel.roadsterDetails!.details)
                
                HStack {
                    
                    Toggle("See where's Elon Musk's Tesla", isOn: $showingImmersiveSpace)
                        .toggleStyle(.button)
                    
                    Model3D(named: "Scene", bundle: roadsterBundle) { roadster in
                        roadster
                            .resizable()
                            .frame(width: 150, height: 100)
                            .rotation3DEffect(Rotation3D(angle: Angle2D(degrees: 5 * context.date.timeIntervalSinceReferenceDate), axis: .y))
                    } placeholder: {
                        Text("Loading...")
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                }
                
            }
            
        }
        .onAppear {
            Task {
                await viewModel.getRoadsterDetails()
            }
        }
        .onChange(of: showingImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "roadster-immersive-space")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
        
    }
}

#Preview {
    RoadsterView()
        .environment(ViewModel())
        .glassBackgroundEffect()
}
