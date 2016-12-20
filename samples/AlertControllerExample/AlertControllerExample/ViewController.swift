//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Ikarious on 2016. 10. 6..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var alertActionOneButton: UIButton!
    var alertActionOneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alert Action One Button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.titleLabel?.textAlignment = NSTextAlignment.center
        //TODO 원리 알아보기
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var alertActionTwoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alert Action Two Button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var alertActionThreeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alert Action Three Button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var alert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //Test Buttons Event Settings
        alertActionOneButton.addTarget(self, action: #selector(self.alertActionOneButton(sender:)), for: UIControlEvents.touchUpInside)
        alertActionTwoButton.addTarget(self, action: #selector(self.alertActionTwoButton(sender:)), for: UIControlEvents.touchUpInside)
        alertActionThreeButton.addTarget(self, action: #selector(self.alertActionThreeButton(sender:)), for: UIControlEvents.touchUpInside)
        
        //Test Buttons Attach View Controller
        self.view.addSubview(alertActionOneButton)
        self.view.addSubview(alertActionTwoButton)
        self.view.addSubview(alertActionThreeButton)
        
        //Test Buttons Add Constraints
        addOneButtonConstraints()
        addTwoButtonConstraints()
        addThreeButtonConstraints()
    }
    
    //Add Constraint
    func addOneButtonConstraints() {
        let oneButtonLeadingConstraint = NSLayoutConstraint(item: alertActionOneButton, attribute: .leading, relatedBy: .equal
            , toItem: view, attribute: .leading, multiplier: 1, constant: 15)
        let oneButtonTrailingConstraint = NSLayoutConstraint(item: alertActionOneButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -15)
        
        let oneButtonTopConstraint = NSLayoutConstraint(item: alertActionOneButton, attribute: .top, relatedBy: .equal
            , toItem: view, attribute: .top, multiplier: 1, constant: 100)
        
        NSLayoutConstraint.activate([oneButtonLeadingConstraint, oneButtonTrailingConstraint, oneButtonTopConstraint])
    }
    
    func addTwoButtonConstraints() {
        
        
        let twoButtonLeadingConstraint = NSLayoutConstraint(item: alertActionTwoButton, attribute: .leading, relatedBy: .equal
            , toItem: alertActionOneButton, attribute: .leading, multiplier: 1, constant: 0)
        let twoButtonTrailingConstraint = NSLayoutConstraint(item: alertActionTwoButton, attribute: .trailing, relatedBy: .equal, toItem: alertActionOneButton, attribute: .trailing, multiplier: 1, constant: 0)
        
        let twoButtonTopConstraint = NSLayoutConstraint(item: alertActionTwoButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 200)
        
        NSLayoutConstraint.activate([twoButtonTopConstraint, twoButtonLeadingConstraint, twoButtonTrailingConstraint])
    }
    
    func addThreeButtonConstraints() {
        
        let threeButtonTopConstraint = NSLayoutConstraint(item: alertActionThreeButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 300)
        
        let threeButtonLeadingConstraint = NSLayoutConstraint(item: alertActionThreeButton, attribute: .leading, relatedBy: .equal
            , toItem: alertActionOneButton, attribute: .leading, multiplier: 1, constant: 0)
        
        let threeButtonTrailingConstraint = NSLayoutConstraint(item: alertActionThreeButton, attribute: .trailing, relatedBy: .equal, toItem: alertActionOneButton, attribute: .trailing, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([threeButtonTopConstraint, threeButtonLeadingConstraint, threeButtonTrailingConstraint])
    }
    
    func alertActionOneButton(sender: UIButton) {
        //Alert Controller Settings
        let alert = UIAlertController(title: "TEST ALERT OneButton", message: "ALERT 테스트 중입니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

        //Add Action Handler Closure Example
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//            switch action.style {
//            case .default :
//                print("Default Alert")
//            case .cancel :
//                print("Cancel Alert")
//            case .destructive :
//                print("Destructive Alert")
//            }
//        }))
        
    }
    
    func alertActionTwoButton(sender: UIButton) {
        let alert = UIAlertController(title: "TEST ALERT TwoButton", message: "ALERT 테스트 중입니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default :
                print("pressed default OK alert")
            case .cancel :
                print("pressed cancel alert")
            case .destructive :
                print("pressed destructive alert")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            switch action.style {
            case .default :
                print("pressed default OK alert")
            case .cancel :
                print("pressed cancel alertt")
            case .destructive :
                print("pressed destructive alert")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertActionThreeButton(sender: UIButton) {
        let alert = UIAlertController(title: "TEST ALERT TwoButton", message: "ALERT 테스트 중입니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "One(OK) Button", style: .default, handler: { action in
            switch action.style {
            case .default :
                print("pressed default OK alert")
            case .cancel :
                print("pressed cancel alert")
            case .destructive :
                print("pressed destructive alert")
            }
        }))
        alert.addAction(UIAlertAction(title: "Two(Canel) Button", style: .cancel, handler: { action in
            switch action.style {
            case .default :
                print("pressed default OK alert")
            case .cancel :
                print("pressed cancel alertt")
            case .destructive :
                print("pressed destructive alert")
            }
        }))
        alert.addAction(UIAlertAction(title: "Three(Delete) Button", style: .destructive, handler: { action in
            switch action.style {
            case .default :
                print("pressed default OK alert")
            case .cancel :
                print("pressed cancel alertt")
            case .destructive :
                print("pressed destructive alert")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

