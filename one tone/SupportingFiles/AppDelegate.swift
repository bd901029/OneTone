//
//  AppDelegate.swift
//  one tone
//
//  Created by Love on 21/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications
import IQKeyboardManagerSwift
import CoreLocation
import FBSDKCoreKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,CLLocationManagerDelegate {

    var window: UIWindow?
    
    var locationManager = CLLocationManager()
    
    let requestIdentifier = "SampleRequest"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Ok"
        IQKeyboardManager.shared.toolbarTintColor = hexStringToUIColor(hex: "#37F0B0")
        
        askForNotificationPermission(application)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.tokenRefreshNotification),
                                               name: NSNotification.Name.InstanceIDTokenRefresh,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self, selector:
            #selector(self.fcmConnectionStateChange), name:
            NSNotification.Name.MessagingConnectionStateChanged, object: nil)
        
        
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]
        ) -> Bool {
        
        
        let facebookDidHandle = FBSDKApplicationDelegate.sharedInstance().application(
            application,
            open: url as URL!,
            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
            annotation: options)
        
        
        
        
        return facebookDidHandle
        
    }
    
    
    
    private func application(application: UIApplication,
                             openURL url: URL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        
        
        let facebookDidHandle = FBSDKApplicationDelegate.sharedInstance().application(
            application,
            open: url as URL!,
            sourceApplication: sourceApplication,
            annotation: annotation)
        
        
        
        return facebookDidHandle
    }
    
    
    
    
    func openNotificationInSettings() {
        let alertController = UIAlertController(title: "Notification Alert", message: "Please enable Notification from Settings to never miss a text.", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    })
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        DispatchQueue.main.async {
            self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    func askForNotificationPermission(_ application: UIApplication) {
        let isRegisteredForRemoteNotifications = UIApplication.shared.isRegisteredForRemoteNotifications
        if !isRegisteredForRemoteNotifications {
            if #available(iOS 10.0, *) {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                    (granted, error) in
                    if error == nil {
                        if !granted {
                            self.openNotificationInSettings()
                        } else {
                            UNUserNotificationCenter.current().delegate = self
                        }
                    }
                }
            } else {
                // Fallback on earlier versions
                let settings: UIUserNotificationSettings =
                    UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
                application.registerUserNotificationSettings(settings)
            }
        } else {
            if #available(iOS 10.0, *) {
                UNUserNotificationCenter.current().delegate = self
            } else {
                // Fallback on earlier versions
            }
        }
        
        application.registerForRemoteNotifications()
    }
    
    
    @objc func fcmConnectionStateChange() {
        if Messaging.messaging().isDirectChannelEstablished {
            
            print("Connected to FCM.")
            
        } else {
            
            print("Disconnected from FCM.")
            
        }
    }
    
    func connectFcm(){
        
        guard InstanceID.instanceID().token() != nil else {
            return;
        }
        
        Messaging.messaging().shouldEstablishDirectChannel = true
        
    }
    
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        
        
        print("Firebase registration token: \(fcmToken)")
        
        UserDefaults.standard.set("\(fcmToken)", forKey: "deviceToken")
        
     
        
        
    }
    
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
        
        Messaging.messaging().apnsToken = deviceToken
        
        let deviceTokenString = deviceToken.reduce("") { $0 + String(format: "%02X", $1) }
        
        print("APNs device token: \(deviceTokenString)")
        
        
    }
    
    @objc func tokenRefreshNotification(_ notification: Notification) {
        
        if let refreshedToken = InstanceID.instanceID().token() {
            
            print("InstanceID token: \(refreshedToken)")
            
            UserDefaults.standard.set("\(refreshedToken)", forKey: "deviceToken")
            
            
            
        }
        
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print(error)
        
        print("InstanceID token: \(error)")
        
    }
    
    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
        
        
        print("Firebase registration token: \(fcmToken)")
        
        UserDefaults.standard.set("\(fcmToken)", forKey: "deviceToken")
        
    
        
    }
    
    
    func application(application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        Messaging.messaging().apnsToken = deviceToken as Data
        
        
    }
    
    var applicationStateString: String {
        if UIApplication.shared.applicationState == .active {
            
            return "active"
            
        } else if UIApplication.shared.applicationState == .background {
            
            return "background"
            
        }else {
            
            return "inactive"
        }
    }
    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        connectFcm()
        
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }

    
}

@available(iOS 10, *)



extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        if notification.request.identifier == requestIdentifier{
            
            completionHandler( [.alert,.sound,.badge])
            
            print(notification.request.content.userInfo)
            
            
            
        }else{
            
            
            
            
        }
        
    }
    @available(iOS 10, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        
        let hj = userInfo as NSDictionary
        
        print(hj)
        
        
    }
}
extension AppDelegate : MessagingDelegate {
    
    func application(received remoteMessage: MessagingRemoteMessage) {
        
        print("Media Message %@", remoteMessage.appData)
        
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        
        
        if UIApplication.shared.applicationState == .active {
            
            print("foreFround")
            
        }else{
       
            
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        
        
        
        print("[RemoteNotification] applicationState: \(applicationStateString) didReceiveRemoteNotification for iOS9: \(userInfo)")
        
        
        
        if UIApplication.shared.applicationState == .active {
            
            let hj = userInfo as NSDictionary
            
            print(hj)
            
            
            
        }else{
            
            ///background
            let hj = userInfo as NSDictionary
            
            print(hj)
            
            
        }
        
    }
}


