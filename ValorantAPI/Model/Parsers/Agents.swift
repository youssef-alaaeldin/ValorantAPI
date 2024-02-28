//
//  Agents.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 18/02/2024.
//

import Foundation


// MARK: - Agents
struct Agents: Codable {
    let status: Int
    let data: [AgentsDatum]
}

// MARK: - Datum
struct AgentsDatum: Codable {
    let uuid, displayName, description: String //developerName: String
//    let characterTags: [String]?
    let displayIcon: String// displayIconSmall: String
//    let bustPortrait, fullPortrait, fullPortraitV2: String?
    let fullPortrait: String?
//    let killfeedPortrait: String
//    let background: String?
//    let backgroundGradientColors: [String]
//    let assetPath: String
//    let isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent: Bool
//    let role: Role?
//    let recruitmentData: RecruitmentData?
//    let abilities: [Ability]
    let displayIconData: Data?
    let fullPortraitData: Data?
//    let voiceLine: JSONNull?
}

// MARK: - Ability
struct Ability: Codable {
    let slot: Slot
    let displayName, description: String
    let displayIcon: String?
}

enum Slot: String, Codable {
    case ability1 = "Ability1"
    case ability2 = "Ability2"
    case grenade = "Grenade"
    case passive = "Passive"
    case ultimate = "Ultimate"
}

// MARK: - RecruitmentData
struct RecruitmentData: Codable {
    let counterID, milestoneID: String
    let milestoneThreshold: Int
    let useLevelVpCostOverride: Bool
    let levelVpCostOverride: Int
    let startDate, endDate: String

    enum CodingKeys: String, CodingKey {
        case counterID = "counterId"
        case milestoneID = "milestoneId"
        case milestoneThreshold, useLevelVpCostOverride, levelVpCostOverride, startDate, endDate
    }
}

// MARK: - Role
struct Role: Codable {
    let uuid: String
    let displayName: DisplayName
    let description: String
    let displayIcon: String
    let assetPath: String
}

enum DisplayName: String, Codable {
    case controller = "Controller"
    case duelist = "Duelist"
    case initiator = "Initiator"
    case sentinel = "Sentinel"
}

// MARK: - Encode/decode helpers



