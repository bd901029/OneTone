//
//  scheduleKiNibe.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class scheduleKiNibe: UITableViewCell {

    @IBOutlet weak var messages: UILabel!
    @IBOutlet weak var stat: UIImageView!
    @IBOutlet weak var namee: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var redWrong: UIButton!
    
    @IBOutlet weak var Greenright: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        image.layer.masksToBounds = true
//        image.layer.cornerRadius = personImage.frame.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
