//
//  LaunchpadModel.swift
//  VisionX
//
//  Created by Adrián Castilla on 29/6/23.
//

import Foundation

// MARK: - Launchpad
struct Launchpad: Codable, Hashable {
    let images: LaunchpadImages
    let name, fullName, locality, region: String
    let latitude, longitude: Double
    let launchAttempts, launchSuccesses: Int
    let rockets: [String]
    let timezone: String
    let launches: [String]
    let status, details, id: String

    enum CodingKeys: String, CodingKey {
        case images, name
        case fullName = "full_name"
        case locality, region, latitude, longitude
        case launchAttempts = "launch_attempts"
        case launchSuccesses = "launch_successes"
        case rockets, timezone, launches, status, details, id
    }
}

// MARK: - Images
struct LaunchpadImages: Codable, Hashable {
    let large: [String]
}
