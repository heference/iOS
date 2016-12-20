//
//  SampleView.swift
//  ImageDownloadSample
//
//  Created by Ikarious on 2016. 11. 3..
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
    
    let downloadGeneralButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Image Download", for: .normal)
        button.backgroundColor = UIColor.black
        button.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    let photoView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkGray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    func setupViews() {
        self.addSubview(photoView)
        addPhotoViewConstraint()
        
        self.addSubview(downloadGeneralButton)
        addDownloadGeneralButtonConstraint()
        
    }
    
    func addDownloadGeneralButtonConstraint() {
        let top = NSLayoutConstraint(item: downloadGeneralButton, attribute: .top, relatedBy: .equal, toItem: photoView, attribute: .bottom, multiplier: 1, constant: 30)
        
        let leading = NSLayoutConstraint(item: downloadGeneralButton, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 30)
        
        let trailing = NSLayoutConstraint(item: downloadGeneralButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -30)
        
        let bottom = NSLayoutConstraint(item: downloadGeneralButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -30)
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
