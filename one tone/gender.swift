//
//  gender.swift
//  one tone
//
//  Created by Love on 22/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
class gender: AnimationPresent {

    
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var female: UIButton!
    var checkButtonTapped = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()
        done.layer.masksToBounds = true
        done.layer.cornerRadius = self.done.frame.height / 2
        
    }

   
    @IBAction func genderCheck(_ sender: UIButton) {
        if sender == male {
            male.isSelected = true
            female.isSelected = false
        } else if sender == female{
            male.isSelected = false
            female.isSelected = true
        }
        
        if sender.tag == 1  {
          self.male.setImage(UIImage(named: "maleYep.png"), for: .normal)
            self.female.setImage(UIImage(named: "femaleNope.png"), for: .normal)

        }
        else if sender.tag == 2 {
            self.female.setImage(UIImage(named: "femaleYep.png"), for: .normal)
            self.male.setImage(UIImage(named: "MaleNope.png"), for: .normal)

        }
    }
    
    @IBAction func done(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
