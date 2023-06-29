//
//  ViewModel.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import Foundation
import Observation
import Accelerate

@Observable
final class ViewModel {
    
    var selectedImage = ""
    
    var launches: [LaunchElement] = []
    
    var launchRocket: Rocket? = Rocket(height: Diameter(meters: 0.0, feet: 0.0), diameter: Diameter(meters: 0.0, feet: 0.0), mass: Mass(kg: 0, lb: 0), firstStage: FirstStage(thrustSeaLevel: Thrust(kN: 0, lbf: 0), thrustVacuum: Thrust(kN: 0, lbf: 0), reusable: false, engines: 0, fuelAmountTons: 0, burnTimeSEC: 0), secondStage: SecondStage(thrust: Thrust(kN: 0, lbf: 0), payloads: Payloads(compositeFairing: CompositeFairing(height: Diameter(meters: 0.0, feet: 0.0), diameter: Diameter(meters: 0.0, feet: 0.0)), option1: ""), reusable: true, engines: 0, fuelAmountTons: 0, burnTimeSEC: 0), engines: Engines(isp: ISP(seaLevel: 0, vacuum: 0), thrustSeaLevel: Thrust(kN: 0, lbf: 0), thrustVacuum: Thrust(kN: 0, lbf: 0), number: 0, type: "", version: "", layout: "", engineLossMax: 0, propellant1: "", propellant2: "", thrustToWeight: 0.0), landingLegs: LandingLegs(number: 0, material: ""), payloadWeights: [PayloadWeight(id: "", name: "", kg: 0, lb: 0)], flickrImages: [""], name: "", type: "", active: true, stages: 0, boosters: 0, costPerLaunch: 0, successRatePct: 0, firstFlight: "", country: "", company: "", wikipedia: "", description: "", id: "")
    
    var starlink: [Starlink] = []
    
    // MARK: - Launches
    
    var launchesOnLaunchpad: [LaunchElement] = []
    
    func getLaunches() async {
        
        DispatchQueue.main.async {
            self.launches = []
        }
        
        let url = URL(string: "https://api.spacexdata.com/v4/launches")
        
        let (encodedLaunches, _) = try! await URLSession.shared.data(from: url!)
        let decodedLaunches = try! JSONDecoder().decode([LaunchElement].self, from: encodedLaunches)
        
        DispatchQueue.main.async {
            self.launches = decodedLaunches
        }
        
    }
    
    func getSpecificLaunch(launches: [String]) async {
        
        DispatchQueue.main.async {
            self.launchesOnLaunchpad = []
        }
        
        for launch in launches {
            let url = URL(string: "https://api.spacexdata.com/v4/launches/\(launch)")
            
            let (encodedLaunches, _) = try! await URLSession.shared.data(from: url!)
            let decodedLaunches = try! JSONDecoder().decode(LaunchElement.self, from: encodedLaunches)
            
            DispatchQueue.main.async {
                self.launchesOnLaunchpad.append(decodedLaunches)
            }
        }
        
    }
    
    // MARK: - Rockets
    
    var rockets: [Rocket] = []
    
    func getRockets() async {
        
        let url = URL(string: "https://api.spacexdata.com/v4/rockets")
        
        let (encodedRocket, _) = try! await URLSession.shared.data(from: url!)
        let decodedRockets = try! JSONDecoder().decode([Rocket].self, from: encodedRocket)
        
        DispatchQueue.main.async {
            self.rockets = decodedRockets
        }
        
    }
    
    func getSpecificRocket(rocketID: String) async {
        
        let url = URL(string: "https://api.spacexdata.com/v4/rockets/\(rocketID)")
        
        let (encodedRocket, _) = try! await URLSession.shared.data(from: url!)
        let decodedRockets = try! JSONDecoder().decode(Rocket.self, from: encodedRocket)
        
        DispatchQueue.main.async {
            self.launchRocket = decodedRockets
        }
        
    }
    
    // MARK: - Roadster
    
    var roadsterDetails: Roadster? = Roadster(name: "", launchDateUTC: "", launchDateUnix: 0, launchMassKg: 0, launchMassLbs: 0, noradID: 0, epochJd: 0.0, orbitType: "", apoapsisAu: 0.0, periapsisAu: 0.0, semiMajorAxisAu: 0.0, eccentricity: 0.0, inclination: 0.0, longitude: 0.0, periapsisArg: 0.0, periodDays: 0.0, speedKph: 0.0, speedMph: 0.0, earthDistanceKM: 0.0, earthDistanceMi: 0.0, marsDistanceKM: 0.0, marsDistanceMi: 0.0, flickrImages: [""], wikipedia: "", video: "", details: "", id: "")
    
    func getRoadsterDetails() async {
        
        let url = URL(string: "https://api.spacexdata.com/v4/roadster")
        
        let (encodedDetails, _) = try! await URLSession.shared.data(from: url!)
        let decodedDetails = try! JSONDecoder().decode(Roadster.self, from: encodedDetails)
        
        DispatchQueue.main.async {
            self.roadsterDetails = decodedDetails
        }
        
    }
    
    // MARK: - Starlink
    func getStarlinks() async {
        
        let url = URL(string: "https://api.spacexdata.com/v4/starlink")
        
        let (encodedStarlink, _) = try! await URLSession.shared.data(from: url!)
        let decodedStarlink = try! JSONDecoder().decode([Starlink].self, from: encodedStarlink)
        
        DispatchQueue.main.async {
            self.starlink = decodedStarlink
        }
        
    }
    
    // MARK: - Launchpads
    
    var launchpads: [Launchpad] = []
    
    func getLaunchpads() async {
        
        let url = URL(string: "https://api.spacexdata.com/v4/launchpads")
        
        let (encodedLaunchpad, _) = try! await URLSession.shared.data(from: url!)
        let decodedLaunchpad = try! JSONDecoder().decode([Launchpad].self, from: encodedLaunchpad)
        
        DispatchQueue.main.async {
            self.launchpads = decodedLaunchpad
        }
        
    }
    
    // MARK: - Landpads
    var landpads: [Landpad] = []
    
    func getLandpads() async {
        
        let url = URL(string: "https://api.spacexdata.com/v4/landpads")
        
        let (encodedLandpad, _) = try! await URLSession.shared.data(from: url!)
        let decodedLandpad = try! JSONDecoder().decode([Landpad].self, from: encodedLandpad)
        
        DispatchQueue.main.async {
            self.landpads = decodedLandpad
        }
        
    }
    
}
