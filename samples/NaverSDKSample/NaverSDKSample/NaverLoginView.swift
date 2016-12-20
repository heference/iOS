//
//  NaverLoginView.swift
//  NaverSDKSample
//
//  Created by Ikarious on 2016. 9. 30..
//  Copyright © 2016년 heference. All rights reserved.
//

class NaverLoginView: UIView {
    
    var naverLoginButton: UIButton = {
        let loginButtonImage = UIImage(named: "naver_login_long_green")
        let button = UIButton(frame: CGRect(x: 50, y: 200, width: 289, height: 62.5))
        button.setBackgroundImage(loginButtonImage, for: .normal)
        return button
    }()
    
    
}

