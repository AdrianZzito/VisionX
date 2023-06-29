//
//  RoadsterImmersive.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI
import RealityKit
import Earth
import Roadster

struct RoadsterImmersive: View {
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        RealityView { content, attachments in
            guard let earth = try? await Entity(named: "Earth", in: earthBundle) else {
                return
            }
            content.add(earth)
            
            if let earthAttachment = attachments.entity(for: "roadster") {
                earthAttachment.position = [0, 0.7, 0]
                earth.addChild(earthAttachment)
            }
            
        } attachments: {
            RoadsterAttachment()
                .tag("roadster")
        }
        .onAppear {
            Task {
                await viewModel.getRoadsterDetails()
            }
        }
        
    }
}

#Preview {
    RoadsterImmersive()
        .environment(ViewModel())
        .previewLayout(.sizeThatFits)
}
