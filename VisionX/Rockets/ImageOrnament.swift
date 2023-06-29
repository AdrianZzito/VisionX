//
//  ImageOrnament.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

struct ImageOrnament: View {
    
    @Environment(\.dismissWindow) var dismissWindow
    
    var body: some View {
        
        HStack {
            
            Button {
                dismissWindow(id: "image-detailed")
            } label: {
                Image(systemName: "xmark")
            }
            
        }
        .glassBackgroundEffect()
        
    }
}

#Preview {
    ImageOrnament()
}
