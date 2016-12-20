//
//  MainViewController.swift
//  KakaoSDKSample
//
//  Created by Ikarious on 2016. 9. 27..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var resultLabel: UILabel!
    var logoutButton: KOLoginButton!
    var nameLabel: UILabel!
    var userImageView: UIImageView!
    
    var userInfo: KOUser!
    var userName: String!
    var userImageUrlString: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Result Label
        resultLabel = UILabel()
        resultLabel.text = "로그인 결과 페이지"
        resultLabel.textColor = UIColor.white
        resultLabel.frame = CGRect(x: 10, y: 50, width: 300, height: 100)
        self.view.addSubview(resultLabel)
        
        //Logout Button
        logoutButton = KOLoginButton(frame: CGRect(x: 10, y: 600, width: 300, height: 50))
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.addTarget(self, action: #selector(self.kakaoLogout(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(logoutButton)
        
        //Name Label
        nameLabel = UILabel()
        nameLabel.textColor = UIColor.white
        nameLabel.frame = CGRect(x: 10, y: 100, width: 300, height: 100)
        self.view.addSubview(nameLabel)
        
        userImageView = UIImageView(frame: CGRect(x: 10, y: 200, width: 100, height: 100))
        self.view.addSubview(userImageView)
        
        self.showKakaoSessionUserInfo()
    }
    
    func showKakaoSessionUserInfo() {
        KOSessionTask.meTask { (user, error) in
            print("USER INFO \(user)")
            
            self.userInfo = user as! KOUser
            
            DispatchQueue.main.async {
                print("\(self.userInfo.property(forKey: "nickname") as! String)")
                print("\(self.userInfo.property(forKey: "thumbnail_image") as! String)")
                self.nameLabel.text = self.userInfo.property(forKey: "nickname") as! String
                
                let httpUrlString = self.userInfo.property(forKey: "thumbnail_image") as! String
                let url = NSURL(string: httpUrlString)
                let data = NSData(contentsOf: url! as URL)
                self.userImageView.image = UIImage(data: data as! Data)
            }
            
        }
    }
    
    func kakaoLogout(sender: KOLoginButton) {
        KOSession.shared().logoutAndClose{ (success, error) -> Void in
            print("Kakao Logout Complete \(success)")
        }
    }
}
