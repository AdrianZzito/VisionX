//
//  LandpadModel.swift
//  VisionX
//
//  Created by Adrián Castilla on 29/6/23.
//

import Foundation

// MARK: - Landpad
struct Landpad: Codable, Hashable {
    let images: Images
    let name, fullName, status, type: String
    let locality, region: String
    let latitude, longitude: Double
    let landingAttempts, landingSuccesses: Int
    let wikipedia: String
    let details: String
    let launches: [String]
    let id: String

    enum CodingKeys: String, CodingKey {
        case images, name
        case fullName = "full_name"
        case status, type, locality, region, latitude, longitude
        case landingAttempts = "landing_attempts"
        case landingSuccesses = "landing_successes"
        case wikipedia, details, launches, id
    }
}

// MARK: - Images
struct Images: Codable, Hashable {
    let large: [String]
}
