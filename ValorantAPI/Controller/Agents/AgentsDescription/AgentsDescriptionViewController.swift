//
//  AgentsDescriptionViewController.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 20/02/2024.
//

import UIKit
import SDWebImage

class AgentsDescriptionViewController: UIViewController {

    @IBOutlet weak var agentImage: UIImageView!
    
    @IBOutlet weak var ability1: UIImageView!
    @IBOutlet weak var ability2: UIImageView!
    @IBOutlet weak var ability3: UIImageView!
    @IBOutlet weak var ability4: UIImageView!
    @IBOutlet weak var agentDescription: UILabel!
    var agent: AgentsDatum?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showDetails()
        title = agent!.displayName
        
        // Do any additional setup after loading the view.
    }
    

    func showDetails() {
        if let portraitImageData = agent?.fullPortraitData, let portraitImage = UIImage(data: portraitImageData) {
            print("realm")
            agentImage.image = portraitImage
            
        } else {
            print("net")
            agentImage.sd_setImage(with: URL(string: agent!.fullPortrait!))
        }
        agentDescription.text = agent?.description ?? "No Description"
    }

}
