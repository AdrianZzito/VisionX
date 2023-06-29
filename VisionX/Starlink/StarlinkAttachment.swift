//
//  StarlinkAttachment.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI
import RealityKit
import SpaceX

struct StarlinkAttachment: View {
    var body: some View {
        
        VStack {
            
            Model3D(named: "Starlink", bundle: spaceXBundle) { starlink in
                starlink
                    .resizable()
                    .frame(depth: 50)
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            
        }
        
    }
}

#Preview {
    StarlinkAttachment()
}
