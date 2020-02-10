//
//  reciverImage.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class reciverImage: UITableViewCell {
    @IBOutlet weak var reciverProfilePic: UIImageView!
    
    @IBOutlet weak var reciverImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        reciverProfilePic.layer.masksToBounds = true
        reciverProfilePic.layer.cornerRadius = reciverProfilePic.frame.height / 2
        reciverImage.layer.masksToBounds = true
        reciverImage.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
