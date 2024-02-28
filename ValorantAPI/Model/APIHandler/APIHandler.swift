//
//  APIHandler.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 18/02/2024.
//

import Foundation

class APIHandler {
    func fetchDataFromAPI<model: Decodable>(withAttribute attribute: String, completion: @escaping (Result<model, Error>) -> Void) {
        
        guard let url = URL(string: "https://valorant-api.com/v1/\(attribute)") else {return}
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(model.self, from: data!)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
}
