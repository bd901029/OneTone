//
//  inCall.swift
//  one tone
//
//  Created by Love on 24/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class inCall: AnimationPresent {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func endCall(_ sender: UIButton) {
    
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "tabBar")
    }
    
    @IBAction func setting(_ sender: UIButton) {
       self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "setting")
    }
    @IBAction func coin(_ sender: UIButton) {
       self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "BuyCredit")
    }
}
