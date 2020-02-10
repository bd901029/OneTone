//
//  setting.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class setting: AnimationPresent {

    @IBOutlet weak var stackviewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeightOfStackview()
        // Do any additional setup after loading the view.
    }

    func setHeightOfStackview(){
        let modelName = UIDevice.current.modelName
        
        let model5 = "iPhone 5"
        let model5s = "iPhone 5s"
        let model5c = "iPhone 5c"
        let SE = "iPhone SE"
        if modelName == model5 || modelName == model5s || modelName == model5c || modelName == SE{
            self.stackviewHeight.constant = 68
        }
        else{
            self.stackviewHeight.constant = 80
            
        }
        
    }

    @IBAction func done(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func coin(_ sender: UIButton) {
      
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "tryFreePlusMembership")

    }
    @IBAction func coins(_ sender: UIButton) {
        
        
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "BuyCredit")

        
    }
}
