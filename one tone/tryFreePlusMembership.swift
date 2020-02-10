//
//  tryFreePlusMembership.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class tryFreePlusMembership: AnimationPresent {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func cross(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tryFreeplus(_ sender: UIButton) {
  
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "BuyCredit")

    }
}
