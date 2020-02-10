//
//  ReceiverTextCell.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class ReceiverTextCell: UITableViewCell {

    @IBOutlet weak var senderProfileImage: UIImageView!
    
    @IBOutlet weak var senderMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         self.senderMessage.sizeToFit()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
