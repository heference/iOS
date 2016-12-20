//
//  AppDelegate.swift
//  KakaoSDKSample
//
//  Created by Ikarious on 2016. 9. 26..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var loginViewController: UIViewController!
    var mainViewController: UIViewController!
    
    var deviceToken: NSData? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //RootViewController Setting
        reloadRootViewController()
        
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.kakaoSessionDidChangeWithNotification), name: NSNotification.Name.KOSessionDidChange, object: nil)
        
        return true
    }
    
    private func reloadRootViewController() {
        let isOpened = KOSession.shared().isOpen()
        if !isOpened {
            loginViewController = LoginViewController()
        } else {
            mainViewController = MainViewController()
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = isOpened ? self.mainViewController : self.loginViewController
        self.window?.makeKeyAndVisible()
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        KOSession.handleDidEnterBackground()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        KOSession.handleDidBecomeActive()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        //Kakao Talk Login
        KOSession.handleDidBecomeActive()
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //Kakao Talk Login
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url as URL!) {
            return KOSession.handleOpen(url as URL!)
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url as URL!) {
            return KOSession.handleOpen(url as URL!)
        }
        return true
    }
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url as URL!) {
            return KOSession.handleOpen(url as URL!)
        }
        return true
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        self.deviceToken = deviceToken
        print("didRegisterForRemoteNotificationsWithDeviceToken=\(deviceToken)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("didFailToRegisterForRemoteNotificationsWithError=\(error.localizedDescription)")
    }
    
    func kakaoSessionDidChangeWithNotification() {
        reloadRootViewController()
    }
    
}

