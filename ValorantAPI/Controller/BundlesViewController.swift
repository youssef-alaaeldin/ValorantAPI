//
//  BundlesViewController.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 19/02/2024.
//

import UIKit

class BundlesViewController: UIViewController {

    @IBOutlet weak var bundlesTableView: UITableView!
    
    var bundles : Bundles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bundles"
        bundlesTableView.register(UINib(nibName: K.cellsReusable.bundlesCellIdentifier, bundle: nil), forCellReuseIdentifier: K.cellsReusable.bundlesCellIdentifier)
        getBundles()
    }
    

    // MARK: - FetchingData
    
    func getBundles() {
        let apiHandler = APIHandler()
        apiHandler.fetchDataFromAPI(withAttribute: "bundles") { (result: Result<Bundles, Error>) in
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.bundles = data
                    self.bundlesTableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching data from bundles \(error)")
            }
        }
    }

}

//MARK: - BundlesTableViewMethods

extension BundlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let bundlesData = bundles else {
            return 0
        }
        return bundlesData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let bundleData = bundles else {
            let cell = bundlesTableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            return cell
        }
        
        let cell = bundlesTableView.dequeueReusableCell(withIdentifier: K.cellsReusable.bundlesCellIdentifier, for: indexPath) as! BundlesTableViewCell
        let bundle = bundleData.data[indexPath.row]
        
        cell.bunldeImage.sd_setImage(with: URL(string: bundle.displayIcon))
        cell.bundleLabel.text = bundle.displayName
        
        return cell
    }
    
    
}
