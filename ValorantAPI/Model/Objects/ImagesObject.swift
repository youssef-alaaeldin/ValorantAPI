//
//  ImagesObject.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 23/02/2024.
//

import Foundation
import RealmSwift

class ImagesObject: Object {
    @Persisted(primaryKey: true) var agentId: String
    @Persisted var displayIcon: String
    @Persisted var fullPortraitImage: String
    @Persisted var fullPortraitImageData: Data?
    @Persisted var displayIconData: Data?
}
