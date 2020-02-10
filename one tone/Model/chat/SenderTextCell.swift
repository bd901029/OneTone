//
//  SenderTextCell.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class SenderTextCell: UITableViewCell {

    @IBOutlet weak var reciverProfileImage: UIImageView!
    @IBOutlet weak var recivermessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        reciverProfileImage.layer.masksToBounds = true
        reciverProfileImage.layer.cornerRadius = reciverProfileImage.frame.height / 2
        self.recivermessage.sizeToFit()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
