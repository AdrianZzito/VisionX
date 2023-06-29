//
//  VisionXApp.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

@main
struct VisionXApp: App {
    
    var body: some Scene {
        WindowGroup(id: "content-view") {
            ContentView()
        }
        
        WindowGroup(id: "image-detailed") {
            ImageDetailed()
                .environment(ViewModel())
        }
        
        ImmersiveSpace(id: "roadster-immersive-space") {
            RoadsterImmersive()
                .environment(ViewModel())
        }
        
        ImmersiveSpace(id: "starlink") {
            StarlinkImmersive()
                .environment(ViewModel())
        }

    }
}
