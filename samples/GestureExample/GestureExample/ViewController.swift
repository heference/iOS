//
//  ViewController.swift
//  GestureExample
//
//  Created by Ikarious on 2016. 8. 24..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Gesture Init
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.self.tapGesture(_:)))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.self.panGesture(_:)))
        
        registPanGestureRecognizer(panGesture)
        registTapGestureRecognizer(tapGesture)

    }
    
    //TapGestureRecognizer 등록
    func registTapGestureRecognizer(tapGesture: UITapGestureRecognizer) {
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    //PanGestureRecognizer 등록
    func registPanGestureRecognizer(panGesture: UIPanGestureRecognizer) {
        panGesture.delegate = self
        panGesture.maximumNumberOfTouches = 1
        view.addGestureRecognizer(panGesture)
    }
    
    
    //Delegate Call PanGesture Method
    func panGesture(panGesture: UIPanGestureRecognizer) {
        drawCircle(panGesture.locationInView(self.view))
    }
    
    ////Delegate Call TapGesture Method
    func tapGesture(tapGesture: UITapGestureRecognizer) {
        drawCircle(tapGesture.locationInView(self.view))
    }
    
    func drawCircle(cgPoint: CGPoint) {
        let circle = UIView(frame: CGRect(origin: cgPoint, size: CGSize(width: 25, height: 25)))
        circle.backgroundColor = UIColor.blackColor()
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = 12.5
        self.view.addSubview(circle)
    }

}

