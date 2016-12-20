//
//  SampleView.swift
//  CameraPhotoLibrarySample
//
//  Created by Ikarious on 2016. 11. 1..
//  Copyright © 2016년 heference. All rights reserved.
//

import Foundation
import UIKit

class SampleView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let cameraButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Camera Call", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    let photoButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Photo Library Call", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    let photoView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    func setupViews() {
        self.addSubview(photoView)
        addPhotoViewConstraint()        
        
        self.addSubview(cameraButton)
        addCameraButtonConstraint()
        
        self.addSubview(photoButton)
        addPhotoButtonConstraint()

    }
    
    func addCameraButtonConstraint() {
        let top = NSLayoutConstraint(item: cameraButton, attribute: .top, relatedBy: .equal, toItem: photoView, attribute: .bottom, multiplier: 1, constant: 10)
        
        let leading = NSLayoutConstraint(item: cameraButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 30)
        
        let trailing = NSLayoutConstraint(item: cameraButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -30)
        
        let bottom = NSLayoutConstraint(item: cameraButton, attribute: .bottom, relatedBy: .equal, toItem: cameraButton, attribute: .top, multiplier: 1, constant: 30)
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
    }
    
    func addPhotoButtonConstraint() {
        let top = NSLayoutConstraint(item: photoButton, attribute: .top, relatedBy: .equal, toItem: cameraButton, attribute: .bottom, multiplier: 1, constant: 10)
        
        let leading = NSLayoutConstraint(item: photoButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 30)
        
        let trailing = NSLayoutConstraint(item: photoButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -30)
        
        let bottom = NSLayoutConstraint(item: photoButton, attribute: .bottom, relatedBy: .equal, toItem: photoButton, attribute: .top, multiplier: 1, constant: 30)
        
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
    }
    
    func addPhotoViewConstraint() {
        let top = NSLayoutConstraint(item: photoView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
        
        let leading = NSLayoutConstraint(item: photoView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        
        let trailing = NSLayoutConstraint(item: photoView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        
        let bottom = NSLayoutConstraint(item: photoView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -120)
        
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
    }
    
}

//extension SampleView {
//    func addConstraints(view: UIView, toView: UIView) {
//        let top = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: toView, attribute: .top, multiplier: 1, constant: <#T##CGFloat#>)
//    }
//}
