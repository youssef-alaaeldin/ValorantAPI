//
//  BundlesTableViewCell.swift
//  ValorantAPI
//
//  Created by Yousuf Abdelfattah on 19/02/2024.
//

import UIKit

class BundlesTableViewCell: UITableViewCell {

    @IBOutlet weak var bundleLabel: UILabel!
    @IBOutlet weak var bunldeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
