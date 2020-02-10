//
//  incommingCall.swift
//  one tone
//
//  Created by Love on 23/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class incommingCall: AnimationPresent {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var rejected: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personImage.layer.masksToBounds = true
        personImage.layer.cornerRadius = self.personImage.frame.height / 2
        personImage.layer.borderWidth = 6.0
        personImage.layer.borderColor = UIColor.white.cgColor
        
        rejected.layer.masksToBounds = true
        rejected.layer.cornerRadius = rejected.frame.height / 2


    }

    @IBAction func rejected(_ sender: UIButton) {
      
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "inCall")
    }
    
    @IBAction func settings(_ sender: UIButton) {
     
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "setting")
    }
    @IBAction func coin(_ sender: UIButton) {
        
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "BuyCredit")
    }
}
