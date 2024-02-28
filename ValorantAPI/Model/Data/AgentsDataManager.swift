//
//  AgentsDataManager.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 25/02/2024.
//

import Foundation
import RealmSwift
import UIKit


enum ImageType {
    case displayIcon
    case portrait
}

class AgentsDataManager {
    
    let realm = try! Realm()
    
    
    func fetchAgentsDataFromAPI(completion: @escaping ([AgentsDatum]) -> Void) {
        let apiHandler = APIHandler()
        apiHandler.fetchDataFromAPI(withAttribute: "agents") { (result: Result<Agents, Error>) in
            switch result {
            case .success(let data):
                self.saveDataToRealm(data)
                let agentsData = self.convertAgentsDataFromAPI(data)
                completion(agentsData)
                
            case .failure(let error):
                print("Error fetching agent data from API: \(error)")
                let agentsObjects = self.getAgentsObjectsFromRealm()
                let agentsData = self.convertAgentsDataFromRealm(agentsObjects)
                completion(agentsData)
                
                
                
            }
        }
    }
    
    
    
    func convertAgentsDataFromAPI(_ agents: Agents) -> [AgentsDatum] {
        return agents.data.map { agent in
            return AgentsDatum(
                uuid: agent.uuid,
                displayName: agent.displayName,
                description: agent.description,
                displayIcon: agent.displayIcon,
                fullPortrait: agent.fullPortrait,
                displayIconData: agent.displayIconData,
                fullPortraitData: agent.fullPortraitData
            )
        }
    }
    
    func convertAgentsDataFromRealm(_ agentsObjects: Results<AgentsObject>) -> [AgentsDatum] {
        return agentsObjects.compactMap { agentObject in
            guard let imageObject = agentObject.image else {
                return nil
            }
            let displayIcondata = imageObject.displayIconData
            let fullPortraitData = imageObject.fullPortraitImageData
            return AgentsDatum(
                uuid: agentObject.id,
                displayName: agentObject.name,
                description: agentObject.agentDescription,
                displayIcon: imageObject.displayIcon,
                fullPortrait: imageObject.fullPortraitImage,
                displayIconData: displayIcondata,
                fullPortraitData: fullPortraitData
            )
        }
    }
    
    func getAgentsObjectsFromRealm() -> Results<AgentsObject> {
        let realm = try! Realm()
        return realm.objects(AgentsObject.self)
    }
    
    //MARK: - Image downloading and caching
    func downloadImage(with urlString: String, imageObject: ImagesObject,completion: @escaping (Data?) -> Void) {
        if let imageURL = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
                guard let data = data, error == nil else {return}
                
                guard let compressedData = UIImage(data: data)?.jpegData(compressionQuality: 0.1) else {return}
                
                completion(compressedData)
            }
            task.resume()
        } else {
            print("Invalid URL for agent display icon")
        }
        
        
    }
    
    
    func saveDataToRealm(_ data: Agents) {
        let realm = try! Realm()
//        guard realm.objects(AgentsObject.self).isEmpty else {
//            print("Data already exists in Realm. Skipping save operation.")
//            return
//        }
        try? realm.write {
            realm.deleteAll()
        }
        
        for agent in data.data {
            
            let agentObject = AgentsObject()
            let imageObject = ImagesObject()
            
            agentObject.id = agent.uuid
            agentObject.name = agent.displayName
            agentObject.agentDescription = agent.description
            
            imageObject.agentId = agent.uuid
            imageObject.displayIcon = agent.displayIcon
            imageObject.fullPortraitImage = agent.fullPortrait ?? ""
            
            
            self.downloadImage(with: agent.displayIcon, imageObject: imageObject) { compressedData in
                let realm = try! Realm()
                try? realm.write {
                    imageObject.displayIconData = compressedData
                    agentObject.image = imageObject
                }
            }
            self.downloadImage(with: agent.fullPortrait ?? "", imageObject: imageObject) {
                compressedPortraitImageData in
                let realm = try! Realm()
                try? realm.write {
                    imageObject.fullPortraitImageData = compressedPortraitImageData
                    agentObject.image = imageObject
                    realm.add(agentObject)
                }
            }
            
        }
    }
    
    
    
    
}
