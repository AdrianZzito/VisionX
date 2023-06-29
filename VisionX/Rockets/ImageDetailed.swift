//
//  ImageDetailed.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

struct ImageDetailed: View {
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: viewModel.selectedImage))
                .shadow(radius: 10)
                .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
            
        }
        .ornament(attachmentAnchor: .scene(alignment: .bottom)) {
            ImageOrnament()
        }
        
    }
}

#Preview {
    ImageDetailed()
}
