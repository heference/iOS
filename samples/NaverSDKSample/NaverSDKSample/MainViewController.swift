//
//  MainViewController.swift
//  NaverSDKSample
//
//  Created by Ikarious on 2016. 9. 29..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, XMLParserDelegate {
    
//    lazy var resultLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.white
//        label.frame = CGRect(x: 50, y: 30, width: 300, height: 100)
//        return label
//    }()
    
   
    var resultLabel: UILabel!
    var logoutButton: UIButton!
    var dataList: [[String:String]] = []
    var detailData: [String:String] = [:]
    var elementTemp: String = ""
    var blank: Bool = false
    
    var parser: XMLParser!
    var parsingData: String! = String("")
    
    var parseSuccess: Bool = false
    var profileImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Naver User Profile XML Parse
        requestNaverUserProfile()
        
        //Result Label
        resultLabel = UILabel()
        resultLabel.textColor = UIColor.white
        resultLabel.frame = CGRect(x: 50, y: 30, width: 300, height: 100)
        self.view.addSubview(resultLabel)

        //Logout Button
        let loginButtonImage = UIImage(named: "naver_logout_green")
        logoutButton = UIButton(frame: CGRect(x: 50, y: 200, width: 181.25, height: 62.5))
        logoutButton.setBackgroundImage(loginButtonImage, for: .normal)
        logoutButton.addTarget(self, action: #selector(self.naverLogout(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(logoutButton)
        
        profileImageView = UIImageView(frame: CGRect(x: 50, y: 300, width: 200, height: 200))
        self.view.addSubview(profileImageView)
        
        requestNaverUserProfile()
    }
    
    func naverLogout(sender: UIButton) {
        print("Logout")
        let naverLoginConnection: NaverThirdPartyLoginConnection = NaverThirdPartyLoginConnection.getSharedInstance()
        naverLoginConnection.requestDeleteToken()
        
        self.present(LoginViewController(), animated: true, completion: nil)
    }
    
    func requestNaverUserProfile() {
        DispatchQueue.global(qos: .default).async {
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
                        //                    print(String(data: data!, encoding: String.Encoding.utf8))
                        self.parser = XMLParser(data: data!)
                        self.parser.delegate = self
                        self.parseSuccess = self.parser.parse()
                        
                        //View Main Thread 호출
                        DispatchQueue.main.async(execute: {
                            if self.parseSuccess {
                                self.resultLabel.text = self.detailData["nickname"]!
                                
                                let httpUrlString = self.detailData["profile_image"]
                                let url = NSURL(string: httpUrlString!)
                                let data = NSData(contentsOf: url! as URL)
                                self.profileImageView.image = UIImage(data: data as! Data)
                                print("UIView Refresh And Set Value Success")
                            }
                        })
                    }
                }
                task.resume()
            } else {
                print("Access Token Expired")
            }
        }
    }

    
    //conform XMLParserDelegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        print("didStartElement \(elementName)")
        
        //XML로부터 Key 값을 추출
        elementTemp = elementName
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("foundCharacters \(string)")
        
        //XML로부터 Key에 대해 값을 넣어준다
        if blank == true && elementTemp != "message" {
            detailData[elementTemp] = string
        } else if blank == true && elementTemp != "nickname"{
            detailData[elementTemp] = string
        } else if blank == true && elementTemp != "email"{
            detailData[elementTemp] = string
        } else if blank == true && elementTemp != "profile_image"{
            detailData[elementTemp] = string
        } else if blank == true && elementTemp != "name"{
            detailData[elementTemp] = string
        }
        
        print(detailData)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //XML로부터 추출한 완성된 데이터를 딕셔너리 배열에 담아준다
        print("didEndElement \(elementName)")
        
        if detailData[elementName] != "" && detailData[elementName] != nil{
            self.parsingData!.append("++\(detailData[elementName]!)++")
        }
        blank = false
        
        print("parsingData \(parsingData!)")
    }
    
    
    
}
