//
//  RoadsterModel.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import Foundation

// MARK: - Roadster
struct Roadster: Codable {
    let name, launchDateUTC: String
    let launchDateUnix, launchMassKg, launchMassLbs, noradID: Int
    let epochJd: Double
    let orbitType: String
    let apoapsisAu, periapsisAu, semiMajorAxisAu, eccentricity: Double
    let inclination, longitude, periapsisArg, periodDays: Float
    let speedKph, speedMph, earthDistanceKM, earthDistanceMi: Double
    let marsDistanceKM, marsDistanceMi: Double
    let flickrImages: [String]
    let wikipedia, video: String
    let details, id: String

    enum CodingKeys: String, CodingKey {
        case name
        case launchDateUTC = "launch_date_utc"
        case launchDateUnix = "launch_date_unix"
        case launchMassKg = "launch_mass_kg"
        case launchMassLbs = "launch_mass_lbs"
        case noradID = "norad_id"
        case epochJd = "epoch_jd"
        case orbitType = "orbit_type"
        case apoapsisAu = "apoapsis_au"
        case periapsisAu = "periapsis_au"
        case semiMajorAxisAu = "semi_major_axis_au"
        case eccentricity, inclination, longitude
        case periapsisArg = "periapsis_arg"
        case periodDays = "period_days"
        case speedKph = "speed_kph"
        case speedMph = "speed_mph"
        case earthDistanceKM = "earth_distance_km"
        case earthDistanceMi = "earth_distance_mi"
        case marsDistanceKM = "mars_distance_km"
        case marsDistanceMi = "mars_distance_mi"
        case flickrImages = "flickr_images"
        case wikipedia, video, details, id
    }
}
