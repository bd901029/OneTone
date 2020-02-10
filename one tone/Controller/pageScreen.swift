//
//  pageScreen.swift
//  one tone
//
//  Created by Love on 21/03/18.
//  Copyright © 2018 Love. All rights reserved.



var request_action = "LOGIN_WITH_SOCIAL"
var device_token = "\(ud.value(forKey: "deviceToken") as! String)"
var language = "en"
var location_lant = ""
var location_long = ""
var device_name = "\(UIDevice.current.name)"
var device_os = "ios"
var id = ""
var name = ""
var email = ""
var mobile = ""
var file = ""
var social_type = "facebook"




import UIKit
import CoreLocation
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire



let tabBarStoryboard = UIStoryboard(name: "TabBar",bundle: nil)


class pageScreen: AnimationPresent,CLLocationManagerDelegate,FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var connectWithFacebook: UIButton!
    @IBOutlet weak var termsOfService: UILabel!
    
    
    var facebookSignINbutton = FBSDKLoginButton()
    var locManager = CLLocationManager()
    
    var myString:NSString = "By continuing you will agree to the Terms of Service and"
    var myMutableString = NSMutableAttributedString()
    
    
    
    override func viewDidLoad() {
        
        
        
        locManager.delegate = self
        locManager.requestAlwaysAuthorization()
        locManager.requestWhenInUseAuthorization()
        
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedStringKey.font:UIFont(name: "Helvetica Neue", size: 12.0)!])
        myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.darkGray, range: NSRange(location:36,length:16))
        termsOfService.attributedText = myMutableString
        
        super.viewDidLoad()
        
        facebookSignINbutton.delegate = self
        self.facebookSignINbutton.readPermissions = ["public_profile","email"]
        
        self.connectWithFacebook.layer.masksToBounds = true
        self.connectWithFacebook.layer.cornerRadius = self.connectWithFacebook.frame.height / 2
        self.connectWithFacebook.setBackgroundImage(#imageLiteral(resourceName: "linear-blue-gradient-purple-1200x1920-c2-483d8b-000080-a-0-f-14.png"), for: .normal)
        
        if let currentLocation  = locManager.location {
            
            ud.set("\(currentLocation.coordinate.latitude)", forKey: "userLatitude")
            
            ud.set("\(currentLocation.coordinate.longitude)", forKey: "userLongitude")
            
            
        }else{
            
            ud.set("28.6351305", forKey: "userLatitude")
            
            ud.set("77.2807421", forKey: "userLongitude")
            
            
            
        }
        
        
        
        location_lant = "\(ud.value(forKey: "userLatitude") as! String)"
        
        location_long = "\(ud.value(forKey: "userLongitude") as! String)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func connectWithFb(_ sender: UIButton) {
        
        
        
        self.facebookSignINbutton.sendActions(for: .touchUpInside)
        
        
    }
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        SVProgressHUD.show()
        
        
        if ((error) != nil) {
           
            SVProgressHUD.showError(withStatus: "User Cancel Registration")
        }
        else if result.isCancelled {
           
            SVProgressHUD.showError(withStatus: "User Cancel Registration")
            
        }
        else {
            
            if result.grantedPermissions.contains("email") {
                
                let graphRequest:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"first_name,email,picture,name,last_name,middle_name"])
                
                var maindict = [String:AnyObject]()
                
                graphRequest.start(completionHandler: { (connection, result, error) -> Void in
                    
                    if ((error) != nil)
                    {
                        SVProgressHUD.showError(withStatus: "User Cancel Registration")
                        
                        print(error?.localizedDescription ?? "")
                        
                        return
                    }
                    else
                    {
                        maindict = result as! [String : AnyObject]
                        let picdict = maindict["picture"] as! NSDictionary
                        let picdata = picdict["data"] as! NSDictionary
                      
                        if let picUrl = picdata["url"] as? String{
                            
                          file = picUrl
                            
                        }
                        
                        
                        if let fbId = maindict["id"]{
                            
                            
                            id = "\(fbId)"
                            mobile = "\(fbId)"
                            
                        }
                        
                        
                        if let fbName = maindict["name"]{
                            
                            
                            name = "\(fbName)"
                            
                            
                        }
                        
                        
                        if let fbEmail = maindict["email"]{
                            
                            
                            email = "\(fbEmail)"
                            
                            self.login()
                            
                            let loginManager = FBSDKLoginManager()
                            loginManager.logOut()
                            
                            
                            
                            
                            
                        }else if let fbaId = maindict["id"]{
                            
                            email = "\(fbaId)@gmail.com"
                            self.login()
                            
                            let loginManager = FBSDKLoginManager()
                            loginManager.logOut()
                            
                           
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                })
                
            }
        }
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logout ho gya")
    }
    
    
    
    func login(){
        
        
        SVProgressHUD.show()
        
        let parameters : [String:Any] = ["request_action":request_action,"device_token":device_token,"language":language,"location_lant":location_lant,"location_long":location_long,"device_name":device_name,"device_os":device_os,"id":id,"name":name,"email":email,"mobile":mobile,"social_type":social_type,"file":file]
        
        Alamofire.request(socConnectApi,method:.post, parameters: parameters).validate().responseString { (response) in
            
            switch response.result {
            case .success:
                
                _ = (response.response?.statusCode)!
                
                
                if let dictionary = response.value {
                    
                    
                    if let dictValue = anyConvertToDictionary(text: dictionary){
                        
                        
                        if let message = dictValue["message"] as? String{
                            
                            
                            if  dictValue["isSuccess"] as? Bool == true {
                                
                                
                                if let dataValue = dictValue["Result"] as? NSDictionary{
                                    
                                    
                                    print(dataValue)
                                    
                                  
                                }
                                
                              
                              SVProgressHUD.showSuccess(withStatus: message)
                              ud.set(true, forKey: "launchedBefore")
                              self.viewPresent(centerPoint: self.view.center, storyBoard: "TabBar", viewId: "tabBar")
                                
                                
                            }else{
                                
                                
                              SVProgressHUD.showError(withStatus: message)
                                
                            }
                          
                            
                        }
                     
                        
                    }else{
                        
                        SVProgressHUD.showError(withStatus: "Error!")
                        
                        
                    }
                    
                    
                    
                }else{
                    
                    
                    
                    SVProgressHUD.showError(withStatus: "Error!")
                }
                
                
                
            case .failure(let error):
                print(error)
                SVProgressHUD.showError(withStatus: "Error!")
                
                break
                
            }
            
            
            
        }
        
        
        
      
        
        
        
    }
    
    
    
}


