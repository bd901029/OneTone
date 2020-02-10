//
//  splash.swift
//  one tone
//
//  Created by Love on 21/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class splash: AnimationPresent {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            
            self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "pageScreen")
            
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
