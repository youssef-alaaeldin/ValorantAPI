//
//  MapsTableViewCell.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 18/02/2024.
//

import UIKit

class MapsTableViewCell: UITableViewCell {

    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var mapImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
