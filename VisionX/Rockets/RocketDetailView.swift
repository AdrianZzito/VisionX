//
//  RocketDetailView.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import SwiftUI
import RealityKit
import SpaceX

struct RocketDetailView: View {
    
    let rocket: Rocket
    
    @Environment(ViewModel.self) var viewModel
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        TimelineView(.animation) { context in
            VStack {
                
                HStack {
                    
                    VStack {
                        Text(rocket.name)
                            .font(.title)
                            .bold()
                        
                        Text(rocket.description)
                    }
                    
                    switch rocket.name {
                    case "Falcon 9":
                        Model3D(named: rocket.name, bundle: spaceXBundle) { model in
                            model
                                .resizable()
                                .frame(width: 40, height: 400)
                                .frame(depth: 40)
                                .rotation3DEffect(Rotation3D(angle: Angle2D(degrees: 20 * context.date.timeIntervalSinceReferenceDate), axis: .y))
                        } placeholder: {
                            ProgressView()
                        }
                    case "Falcon Heavy":
                        Model3D(named: rocket.name, bundle: spaceXBundle) { model in
                            model
                                .resizable()
                                .frame(width: 75, height: 400)
                                .frame(depth: 30)
                                .rotation3DEffect(Rotation3D(angle: Angle2D(degrees: 20 * context.date.timeIntervalSinceReferenceDate), axis: .y))
                        } placeholder: {
                            ProgressView()
                        }
                    case "Starship":
                        Model3D(named: rocket.name, bundle: spaceXBundle) { model in
                            model
                                .resizable()
                                .frame(width: 60, height: 400)
                                .frame(depth: 100)
                                .rotation3DEffect(Rotation3D(angle: Angle2D(degrees: 20 * context.date.timeIntervalSinceReferenceDate), axis: .y))
                        } placeholder: {
                            ProgressView()
                        }
                    default:
                        ProgressView()
                    }
                    
                }
                
                Divider()
                
                Form {
                    Section("Rocket details") {
                        Text("Active: \(rocket.active ? "Yes":"No")")
                        
                        Text("Stages: \(rocket.stages)")
                        
                        Text("Cost per launch: \(rocket.costPerLaunch)$")
                        
                        Text("Success rate percentage: \(rocket.successRatePct)%")
                        
                        Text("First flight: \(rocket.firstFlight)")
                    }
                    
                    Section("Rocket dimensions") {
                        Text("Height: \(Double(rocket.height.meters!))m")
                        Text("Diameter: \(Double(rocket.diameter.meters!))m")
                        Text("Mass: \(Double(rocket.mass.kg))kg")
                    }
                }
                
                Section("\(rocket.name) picks") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(rocket.flickrImages, id: \.self) { image in
                                AsyncImage(url: URL(string: image)) { intImage in
                                    intImage
                                        .resizable()
                                        .frame(width: 200, height: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                    /*
                                        .onTapGesture {
                                            Task {
                                                viewModel.selectedImage = image
                                                await openWindow(id: "image-detailed")
                                            }
                                        }
                                     */
                                } placeholder: {
                                    Image(systemName: "photo")
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
                
            }
        }
    }
}
