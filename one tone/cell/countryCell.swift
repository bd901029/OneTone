//
//  countryCell.swift
//  one tone
//
//  Created by Love on 22/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class countryCell: UITableViewCell {

    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var viewContainingAll: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        countryImage.layer.masksToBounds = true
        countryImage.layer.cornerRadius = self.countryImage.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    @IBAction func radio(_ sender: UIButton) {
       
        
        
    }
}
