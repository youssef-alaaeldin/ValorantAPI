//
//  AgentsObject.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 23/02/2024.
//

import Foundation
import RealmSwift

class AgentsObject: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var agentDescription: String
    @Persisted var image: ImagesObject?
    
}
