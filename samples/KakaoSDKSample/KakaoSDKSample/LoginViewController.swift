//
//  ViewController.swift
//  KakaoSDKSample
//
//  Created by Ikarious on 2016. 9. 26..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginButton: KOLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton = KOLoginButton(frame: CGRect(x: 10, y: 400, width: 330, height: 50))
        loginButton.setTitle("카카오계정으로 로그인", for: .normal)
        loginButton.addTarget(self, action: #selector(self.kakaoTalkLogin(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(loginButton)
    }
    
    func kakaoTalkLogin(sender: KOLoginButton) {
        let session: KOSession = KOSession.shared();
        
        if session.isOpen() {
            session.close()
        }
        
        session.presentingViewController = self.navigationController
        session.open(completionHandler: { (error) -> Void in
        session.presentingViewController = nil
            if !session.isOpen() {
//                switch (error.) {
//                case Int(KOErrorCancelled.rawValue):
//                    break;
//                default:
//                    UIAlertView(title: "에러", message: error?.localizedDescription, delegate: nil, cancelButtonTitle: "확인").show()
//                    break;
//                }
                print("kakaoTalkLogin isOpen False")
            } else {
                print("kakaoTalkLogin isOpen True")
            }
        }, authParams: nil, authTypes: [KOAuthType.talk.rawValue])
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

