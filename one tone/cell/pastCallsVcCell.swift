//
//  pastCallsVcCell.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class pastCallsVcCell: UITableViewCell {
    @IBOutlet weak var person: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var status: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.person.layer.cornerRadius = self.person.frame.height / 2
        self.person.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
