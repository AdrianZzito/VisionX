//
//  StarlinkImmersive.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI
import RealityKit
import Earth
import SpaceX

struct StarlinkImmersive: View {
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        RealityView { content, attachments in
            guard let earth = try? await Entity(named: "Earth", in: earthBundle) else {
                return
            }
            content.add(earth)
            
            if let starlinkAttachment = attachments.entity(for: "starlinkAttachment") {
                starlinkAttachment.position = []
            }
            
            for starlink in viewModel.starlink {
                
                guard (starlink.longitude != nil) || (starlink.latitude != nil) || (starlink.heightKM != nil) else {
                    return
                }
                
                let starlinkPos = SIMD3<Float>(
                    Float(starlink.longitude!),
                    Float(starlink.latitude!),
                    Float(starlink.heightKM!)
                )
                
                if let starlinkAttachment = attachments.entity(for: starlink.id) {
                    starlinkAttachment.position = starlinkPos
                    earth.addChild(starlinkAttachment)
                    
                }
            }
            
        } attachments: {
            ForEach(viewModel.starlink, id: \.self) { starlink in
                StarlinkAttachment()
                    .tag(starlink.id)
            }
        }
        .onAppear {
            Task {
                await viewModel.getStarlinks()
            }
        }
        
    }
}

#Preview {
    StarlinkImmersive()
        .environment(ViewModel())
}
