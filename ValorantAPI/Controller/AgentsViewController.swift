//
//  AgentsViewController.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 19/02/2024.
//

import UIKit
import RealmSwift
import Reachability

class AgentsViewController: UIViewController {
    
    @IBOutlet weak var agentsCollectionView: UICollectionView!
    
    let realm = try! Realm()
    let agentsDataManager = AgentsDataManager()
    var agents = [AgentsDatum]()
    
    var estimateWidth = 120.0
    var cellMarginSize = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Agents"
        agentsCollectionView.register(UINib(nibName: K.cellsReusable.agentsCellIdentifier, bundle: nil), forCellWithReuseIdentifier: K.cellsReusable.agentsCellIdentifier)
        
        self.setUpGridView()
        fetchData()
    }
    
    func setUpGridView() {
        let flow = agentsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    // MARK: - FetchingData
    
    func fetchData() {
        agentsDataManager.fetchAgentsDataFromAPI { [weak self] agentsFromAPI in
            self?.agents = agentsFromAPI
            DispatchQueue.main.async {
            
                self?.agentsCollectionView.reloadData()
            }
        }
        
    }
    
}

extension AgentsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        agents.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = agentsCollectionView.dequeueReusableCell(withReuseIdentifier: K.cellsReusable.agentsCellIdentifier, for: indexPath) as! AgentsCollectionViewCell
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        let agent = agents[indexPath.row]
        cell.agentLabel.text = agent.displayName
        if let displayIconData = agent.displayIconData, let displayIconImage = UIImage(data: displayIconData) {
            cell.agentImage.image = displayIconImage
        }
        else {
            cell.agentImage.sd_setImage(with: URL(string: agent.displayIcon))
        }
    
        return cell
    }
    
    //MARK: - Navigation to AgentsDescription
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let agent = agents[indexPath.row]
        showAgentDescription(for: agent)
    }
    
    func showAgentDescription(for agent: AgentsDatum) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let agentDescriptionVC = storyboard.instantiateViewController(withIdentifier: "AgentsDescriptionViewController") as? AgentsDescriptionViewController else {
            return
        }
        
        agentDescriptionVC.agent = agent
        
        navigationController?.pushViewController(agentDescriptionVC, animated: true)
    }
    
    
    
    
}

//MARK: -Adjusting collectionview Layout

extension AgentsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = calcWidth()
        return CGSize(width: width, height: width)
    }
    
    func calcWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth ))
        
        let margin = CGFloat(cellMarginSize)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
}
