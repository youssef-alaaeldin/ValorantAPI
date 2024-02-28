// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let maps = try? JSONDecoder().decode(Maps.self, from: jsonData)

import Foundation

// MARK: - Maps
struct Maps: Codable {
    let status: Int
    let data: [MapsDatum]
}

// MARK: - Datum
struct MapsDatum: Codable {
    let uuid, displayName: String
    let narrativeDescription: String?
    let tacticalDescription: TacticalDescription?
    let coordinates: String?
    let displayIcon: String?
    let listViewIcon: String
    let listViewIconTall: String?
    let splash: String
    let stylizedBackgroundImage, premierBackgroundImage: String?
    let assetPath, mapURL: String
    let xMultiplier, yMultiplier, xScalarToAdd, yScalarToAdd: Double
    let callouts: [Callout]?

    enum CodingKeys: String, CodingKey {
        case uuid, displayName, narrativeDescription, tacticalDescription, coordinates, displayIcon, listViewIcon, listViewIconTall, splash, stylizedBackgroundImage, premierBackgroundImage, assetPath
        case mapURL = "mapUrl"
        case xMultiplier, yMultiplier, xScalarToAdd, yScalarToAdd, callouts
    }
}

// MARK: - Callout
struct Callout: Codable {
    let regionName: String
    let superRegionName: SuperRegionName
    let location: Location
}

// MARK: - Location
struct Location: Codable {
    let x, y: Double
}

enum SuperRegionName: String, Codable {
    case a = "A"
    case attackerSide = "Attacker Side"
    case b = "B"
    case c = "C"
    case defenderSide = "Defender Side"
    case mid = "Mid"
}

enum TacticalDescription: String, Codable {
    case aBCSites = "A/B/C Sites"
    case aBSites = "A/B Sites"
}
