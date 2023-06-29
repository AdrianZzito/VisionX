//
//  StarlinkView.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI

struct StarlinkView: View {
    
    @State var showingImmersiveSpace = false
    
    @Environment(ViewModel.self) var viewModel
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        
        VStack {
            
            Toggle("See where are the Starlink satellites now", isOn: $showingImmersiveSpace)
                .toggleStyle(.button)
            
        }
        .onAppear {
            Task {
                await viewModel.getStarlinks()
            }
        }
        .onChange(of: showingImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "starlink")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
        
    }
}

#Preview {
    StarlinkView()
}
