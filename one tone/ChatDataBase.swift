



import Foundation


struct ChatDataBase {
    
    var user_id: String
    var driver_id: String
    var message:String
    var booking_id: String
    var type:String
    
    
    
    init(user_id: String, driver_id: String, message:String, booking_id: String, type:String) {
       
        self.user_id = user_id
        self.driver_id = driver_id
        self.message = message
        self.booking_id = booking_id
        self.type = type
        
    }
}
    


