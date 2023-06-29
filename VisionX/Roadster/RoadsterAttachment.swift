//
//  RoadsterAttachment.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI
import RealityKit
import Roadster

struct RoadsterAttachment: View {
    var body: some View {
        
        VStack {
            Model3D(named: "Scene", bundle: roadsterBundle) { roadster in
                roadster
                    .resizable()
                    .frame(depth: 100)
                    .frame(width: 50, height: 25)
            } placeholder: {
                Text("Loading...")
            }
        }
        
    }
}

#Preview {
    RoadsterAttachment()
        .previewLayout(.sizeThatFits)
}
