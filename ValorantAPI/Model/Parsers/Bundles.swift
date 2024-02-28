// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bundles = try? JSONDecoder().decode(Bundles.self, from: jsonData)

import Foundation

// MARK: - Bundles
struct Bundles: Codable {
    let status: Int
    let data: [BundlesDatum]
}

// MARK: - Datum
struct BundlesDatum: Codable {
    let uuid, displayName: String
    let displayNameSubText: String?
    let description: String
    let extraDescription, promoDescription: String?
    let useAdditionalContext: Bool
    let displayIcon, displayIcon2: String
    let verticalPromoImage: String?
    let assetPath: String
}
