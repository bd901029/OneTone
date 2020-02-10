//
//  Product.swift
//  Daily Geeta Inspirations
//
//  Created by Emobi Technologies Pvt. Ltd on 6/27/17.
//  Copyright © 2017 Emobi. All rights reserved.
//

import Foundation


class Product: CustomStringConvertible {
    let id: Int64?
    var user_id: String
    var driver_id: String
    var message:String
    var booking_id: String
    var type:String
    
   
    
    init(id: Int64, user_id: String, driver_id: String, message:String, booking_id: String, type:String) {
        
        self.id = id
        self.user_id = user_id
        self.driver_id = driver_id
        self.message = message
        self.booking_id = booking_id
        self.type = type
    }
    var description: String {
        return "id = \(self.id ?? 0), user_id = \(self.user_id), driver_id = \(self.driver_id), message = \(self.message), booking_id = \(self.booking_id), type = \(self.type))"
    }
}
