//
//  AppDelegate.swift
//  wagerocity
//
//  Created by Syed Haris Hussain on 10/06/2015.
//  Copyright (c) 2015 Plego. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Fabric
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        var logo = UIImage(named: "logo")?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 15, 0, 15), resizingMode: .Stretch)
        
        [UINavigationBar .appearance().setBackgroundImage(logo, forBarMetrics:.Default)]
        
        MKStoreManager.sharedManager()
        
        Fabric.with([Crashlytics.self()])
        
        UIApplication.sharedApplication().registerForRemoteNotifications()
        UIApplication.sharedApplication().registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Sound , categories: nil))
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        var characterSet: NSCharacterSet = NSCharacterSet( charactersInString: "<>" )
        
        var deviceTokenString: String = ( deviceToken.description as NSString )
            .stringByTrimmingCharactersInSet( characterSet )
            .stringByReplacingOccurrencesOfString( " ", withString: "" ) as String
        
        NSUserDefaults.standardUserDefaults().setObject(deviceTokenString, forKey: Constants.UserDefaults.DeviceToken)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        print(deviceTokenString)
        
        if let userId = Utils.getUser()?.userId {
            ServiceModel.setDeviceToken(userId, deviceToken: deviceTokenString, completion: { (isComplete) -> Void in
                
            })
        }
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print(error)
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        println(userInfo)
        if let aps = userInfo["aps"] as? [NSObject : AnyObject],
            let alert = aps["alert"] as? [NSObject : AnyObject],
            let title = alert["title"] as? String,
            let body = alert["body"] as? String {
            Utils.showMessage(self.window!.rootViewController!, message: body, title: title)
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application BaseViewControlleris about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(
        application: UIApplication,
        openURL url: NSURL,
        sourceApplication: String?,
        annotation: AnyObject?
        ) -> Bool {
            
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    //    func setupNotifications() {
    //
    //        NSNotificationCenter
    //            .defaultCenter()
    //            .addObserverForName(
    //                kMKStoreKitProductsAvailableNotification,
    //                object: nil,
    //                queue: NSOperationQueue.mainQueue())
    //                { note in
    //            println("\(MKStoreKit.sharedKit().availableProducts)")
    //        }
    //
    //        NSNotificationCenter
    //            .defaultCenter()
    //            .addObserverForName(
    //                kMKStoreKitProductPurchasedNotification,
    //                object: nil,
    //                queue: NSOperationQueue.mainQueue())
    //                { note in
    //                    println("\(note.object)")
    //        }
    //
    //        NSNotificationCenter
    //            .defaultCenter()
    //            .addObserverForName(
    //                kMKStoreKitRestoringPurchasesFailedNotification,
    //                object: nil,
    //                queue: NSOperationQueue.mainQueue())
    //                { note in
    //                    println("\(note.object)")
    //        }
    //    }
    
}

