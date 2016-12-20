//
//  AppDelegate.swift
//  NaverSDKSample
//
//  Created by Ikarious on 2016. 9. 27..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let thirdConn: NaverThirdPartyLoginConnection = NaverThirdPartyLoginConnection.getSharedInstance()
        thirdConn.serviceUrlScheme = kServiceAppUrlScheme
        thirdConn.consumerKey = kConsumerKey
        thirdConn.consumerSecret = kConsumerSecret
        thirdConn.appName = kServiceAppName
        
        
        let loginViewController = LoginViewController()
//        let mainViewController = MainViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = loginViewController
        self.window?.makeKeyAndVisible()
        
        
        
        
        return true
    }
    
    //Naver Login Start
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return self.handleWithUrl(url: url as NSURL)
    }
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        return self.handleWithUrl(url: url as NSURL)
    }
    
    func handleWithUrl(url: NSURL) -> Bool {
        
        if(url.scheme! == kServiceAppUrlScheme) {
            if(url.host == kCheckResultPage) {
                
                let thirdConnection: NaverThirdPartyLoginConnection = NaverThirdPartyLoginConnection.getSharedInstance()
                let resultType: THIRDPARTYLOGIN_RECEIVE_TYPE  = thirdConnection.receiveAccessToken(url as URL)
                
                if (SUCCESS == resultType) {
                    print("Getting auth code from NaverApp success")
                } else {
                    print("Getting auth code from NaverApp fail")
                }
            }
            return true
        }
        
        
        return false
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return self.handleWithUrl(url: url as NSURL)
    }
    
    //Naver Login End
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

