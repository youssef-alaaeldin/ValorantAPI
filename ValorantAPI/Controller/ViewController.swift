//
//  ViewController.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 18/02/2024.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var mapsTableView: UITableView!
    
    var mapsData: Maps?
    var agentsData: Agents?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Maps"
        mapsTableView.register(UINib(nibName: K.cellsReusable.mapsCellIdentifier, bundle: nil), forCellReuseIdentifier: K.cellsReusable.mapsCellIdentifier)
        getMapsData()
    }
    
    
}

//MARK: - FetchingData

extension ViewController {
    
    func getMapsData() {
        let apiHandler = APIHandler()
        apiHandler.fetchDataFromAPI(withAttribute: "maps") { (result: Result<Maps, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.mapsData = data
                    self.mapsTableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching maps data \(error)")
            }
            
        }
    }
    
   
}

//MARK: - MapsTableView methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let mapsData = mapsData else {
            return 0 // Return 0 if mapsData is nil
        }
        return mapsData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let mapsData = mapsData else {
            // Handle the case where mapsData is nil
            // Return a placeholder cell or handle it in your UI accordingly
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceholderCell", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellsReusable.mapsCellIdentifier, for: indexPath) as! MapsTableViewCell
        
        // Accessing the first element of mapsData.data array assuming it's not empty
        let map = mapsData.data[indexPath.row]
        
        cell.mapImage.sd_setImage(with: URL(string: map.listViewIcon))
        cell.mapLabel.text = map.displayName
        return cell
    }
    
    
}


//MARK: - AgentsCollectionView methods



