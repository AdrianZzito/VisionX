//
//  StarlinkModel.swift
//  VisionX
//
//  Created by Adrián Castilla on 28/6/23.
//

import Foundation

// MARK: - Starlink
struct Starlink: Codable, Hashable {
    let spaceTrack: SpaceTrack
    let launch: String?
    let version: Version?
    let heightKM, latitude, longitude, velocityKms: Double?
    let id: String

    enum CodingKeys: String, CodingKey, Hashable {
        case spaceTrack, launch, version
        case heightKM = "height_km"
        case latitude, longitude
        case velocityKms = "velocity_kms"
        case id
    }
}

// MARK: - SpaceTrack
struct SpaceTrack: Codable, Hashable {
    let ccsdsOmmVers: String
    let comment: Comment
    let creationDate: String
    let originator: Originator
    let objectName, objectID: String
    let centerName: CenterName
    let refFrame: RefFrame
    let timeSystem: TimeSystem
    let meanElementTheory: MeanElementTheory
    let epoch: String
    let meanMotion, eccentricity, inclination, raOfAscNode: Double
    let argOfPericenter, meanAnomaly: Double
    let ephemerisType: Int
    let classificationType: ClassificationType
    let noradCatID, elementSetNo, revAtEpoch: Int
    let bstar, meanMotionDot, meanMotionDdot, semimajorAxis: Double
    let period, apoapsis, periapsis: Double
    let objectType: ObjectType
    let rcsSize: RCSSize?
    let countryCode: CountryCode?
    let launchDate: String?
    let site: Site?
    let decayDate: String?
    let decayed, file, gpID: Int
    let tleLine0, tleLine1, tleLine2: String

    enum CodingKeys: String, CodingKey, Hashable {
        case ccsdsOmmVers = "CCSDS_OMM_VERS"
        case comment = "COMMENT"
        case creationDate = "CREATION_DATE"
        case originator = "ORIGINATOR"
        case objectName = "OBJECT_NAME"
        case objectID = "OBJECT_ID"
        case centerName = "CENTER_NAME"
        case refFrame = "REF_FRAME"
        case timeSystem = "TIME_SYSTEM"
        case meanElementTheory = "MEAN_ELEMENT_THEORY"
        case epoch = "EPOCH"
        case meanMotion = "MEAN_MOTION"
        case eccentricity = "ECCENTRICITY"
        case inclination = "INCLINATION"
        case raOfAscNode = "RA_OF_ASC_NODE"
        case argOfPericenter = "ARG_OF_PERICENTER"
        case meanAnomaly = "MEAN_ANOMALY"
        case ephemerisType = "EPHEMERIS_TYPE"
        case classificationType = "CLASSIFICATION_TYPE"
        case noradCatID = "NORAD_CAT_ID"
        case elementSetNo = "ELEMENT_SET_NO"
        case revAtEpoch = "REV_AT_EPOCH"
        case bstar = "BSTAR"
        case meanMotionDot = "MEAN_MOTION_DOT"
        case meanMotionDdot = "MEAN_MOTION_DDOT"
        case semimajorAxis = "SEMIMAJOR_AXIS"
        case period = "PERIOD"
        case apoapsis = "APOAPSIS"
        case periapsis = "PERIAPSIS"
        case objectType = "OBJECT_TYPE"
        case rcsSize = "RCS_SIZE"
        case countryCode = "COUNTRY_CODE"
        case launchDate = "LAUNCH_DATE"
        case site = "SITE"
        case decayDate = "DECAY_DATE"
        case decayed = "DECAYED"
        case file = "FILE"
        case gpID = "GP_ID"
        case tleLine0 = "TLE_LINE0"
        case tleLine1 = "TLE_LINE1"
        case tleLine2 = "TLE_LINE2"
    }
}

enum CenterName: String, Codable {
    case earth = "EARTH"
}

enum ClassificationType: String, Codable {
    case u = "U"
}

enum Comment: String, Codable {
    case generatedViaSpaceTrackOrgAPI = "GENERATED VIA SPACE-TRACK.ORG API"
}

enum CountryCode: String, Codable {
    case us = "US"
}

enum MeanElementTheory: String, Codable {
    case sgp4 = "SGP4"
}

enum ObjectType: String, Codable {
    case payload = "PAYLOAD"
}

enum Originator: String, Codable {
    case the18Spcs = "18 SPCS"
}

enum RCSSize: String, Codable {
    case large = "LARGE"
    case medium = "MEDIUM"
}

enum RefFrame: String, Codable {
    case teme = "TEME"
}

enum Site: String, Codable {
    case afetr = "AFETR"
    case afwtr = "AFWTR"
}

enum TimeSystem: String, Codable {
    case utc = "UTC"
}

enum Version: String, Codable {
    case prototype = "prototype"
    case v09 = "v0.9"
    case v10 = "v1.0"
    case v15 = "v1.5"
}
