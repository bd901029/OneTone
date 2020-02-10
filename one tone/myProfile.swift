//
//  myProfile.swift
//  one tone
//
//  Created by Love on 25/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class myProfile: AnimationPresent {
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var connectToInstagram: UIButton!
    @IBOutlet weak var stackviewheight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personImage.layer.masksToBounds = true
        personImage.layer.cornerRadius = self.personImage.frame.height / 2
        personImage.layer.borderWidth = 6.0
        personImage.layer.borderColor = UIColor.white.cgColor
        
        connectToInstagram.layer.masksToBounds = true
        connectToInstagram.layer.cornerRadius = connectToInstagram.frame.height / 2
        connectToInstagram.layer.borderColor = UIColor(red: 75.0/255.0, green: 115.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        connectToInstagram.layer.borderWidth = 1.0
        setHeightOfStackview()
    }

   
    @IBAction func oneTone(_ sender: UIButton) {
    
        
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "tryFreePlusMembership")

    }
    @IBAction func buycoin(_ sender: UIButton) {
     
        
        self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "BuyCredit")

        
    }
    
    func setHeightOfStackview(){
        let modelName = UIDevice.current.modelName
        
        let model5 = "iPhone 5"
        let model5s = "iPhone 5s"
        let model5c = "iPhone 5c"
        let SE = "iPhone SE"
        if modelName == model5 || modelName == model5s || modelName == model5c || modelName == SE{
           self.stackviewheight.constant = 68
        }
        else{
            self.stackviewheight.constant = 80

        }
        
    }
}
