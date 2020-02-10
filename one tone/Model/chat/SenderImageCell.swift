//
//  SenderImageCell.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class SenderImageCell: UITableViewCell {
    @IBOutlet weak var senderProfilePic: UIImageView!
    @IBOutlet weak var senderImages: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        senderProfilePic.layer.masksToBounds = true
        senderProfilePic.layer.cornerRadius = senderProfilePic.frame.height / 2
        
        senderImages.layer.masksToBounds = true
        senderImages.layer.cornerRadius = 5.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
