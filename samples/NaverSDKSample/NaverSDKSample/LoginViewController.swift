//
//  ViewController.swift
//  NaverSDKSample
//
//  Created by Ikarious on 2016. 9. 27..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, NaverThirdPartyLoginConnectionDelegate {
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let naverThirdPartyLoginConnection = NaverThirdPartyLoginConnection.getSharedInstance()
        naverThirdPartyLoginConnection?.delegate = self
        
        let loginButtonImage = UIImage(named: "naver_login_long_green")
        loginButton = UIButton(frame: CGRect(x: 50, y: 200, width: 289, height: 62.5))
        loginButton.setBackgroundImage(loginButtonImage, for: .normal)
        loginButton.addTarget(self, action: #selector(self.naverLogin(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginButton)
        
    }
    
    func naverLogin(sender: UIButton) {
        self.requestThirdPartyLogin()
    }
    
    func requestThirdPartyLogin() {
        let naverLoginConnection: NaverThirdPartyLoginConnection = NaverThirdPartyLoginConnection.getSharedInstance()
        naverLoginConnection.isNaverAppOauthEnable = false
        naverLoginConnection.isInAppOauthEnable = true
        
        naverLoginConnection.consumerKey = kConsumerKey
        naverLoginConnection.consumerSecret = kConsumerSecret
        naverLoginConnection.appName = kServiceAppName
        naverLoginConnection.serviceUrlScheme = kServiceAppUrlScheme
        
        naverLoginConnection.delegate = self
        naverLoginConnection.requestThirdPartyLogin()
        
        
    }
    
    func requestRefreshToken() {
        let naverLoginConnection: NaverThirdPartyLoginConnection = NaverThirdPartyLoginConnection.getSharedInstance()
        naverLoginConnection.consumerKey = kConsumerKey
        naverLoginConnection.consumerSecret = kConsumerSecret
        naverLoginConnection.requestAccessTokenWithRefreshToken()
    }
    
    func requestNaverUserProfile() {
        let naverLoginConnection: NaverThirdPartyLoginConnection = NaverThirdPartyLoginConnection.getSharedInstance()
        
        if naverLoginConnection.isValidAccessTokenExpireTimeNow() {
            let urlString: String = "https://openapi.naver.com/v1/nid/getUserProfile.xml"
            let url = URL(string: urlString)
            let authValue = String("Bearer \(naverLoginConnection.accessToken!)")
            let session = URLSession.shared
            
            var request = URLRequest(url: url!)
            request.setValue(authValue, forHTTPHeaderField: "Authorization")
            
            let task = session.dataTask(with: request) {
                data, response, error in
                
                if error != nil {
                    
                } else {
                    print(String(data: data!, encoding: String.Encoding.utf8))
                }
                
                }
            task.resume()
        } else {
            print("Access Token Expired")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Protocol Conform Method
    func oauth20ConnectionDidFinishDeleteToken() {
        print("oauth20ConnectionDidFinishDeleteToken")
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("oauth20ConnectionDidFinishRequestACTokenWithAuthCode")
        //Login Done Right now
//        requestNaverUserProfile()
        self.present(MainViewController(), animated: true, completion: nil)
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("oauth20ConnectionDidFinishRequestACTokenWithRefreshToken")
        //Login Done
//        requestNaverUserProfile()
        self.present(MainViewController(), animated: true, completion: nil)
    }
    
    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
//        print(request.description)
        if request != nil {
            presentWebViewControllerWithRequest(loginRequest: request)
        } else {
            print("Nil Request")
        }
    }
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("Error : ")
    }
    
    //In-App Browser
    func presentWebViewControllerWithRequest(loginRequest: URLRequest) {
        print(loginRequest.description)
        
        let inAppBrowser: NLoginThirdPartyOAuth20InAppBrowserViewController = NLoginThirdPartyOAuth20InAppBrowserViewController(request: loginRequest)
        self.present(inAppBrowser, animated: true, completion: nil)
    }
    
    
}


