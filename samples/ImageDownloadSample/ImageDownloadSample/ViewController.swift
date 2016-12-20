//
//  ViewController.swift
//  ImageDownloadSample
//
//  Created by Ikarious on 2016. 11. 3..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let sampleView = SampleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Sample View Setting
        sampleView.frame = self.view.bounds
        self.view.addSubview(sampleView)
        
        sampleView.downloadGeneralButton.addTarget(self, action: #selector(self.imageDownload(sender: )), for: UIControlEvents.touchUpInside)
    }
    
    func imageDownload(sender: UIButton) {
        print("Image Download")
        
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: NSURL(string: "http://1.237.195.117:8080/cmn/imageViewer.data?img_name=1477288722457.jpg") as! URL)
        
        //Request Task
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error -> Void in
            
            print("HTTP Session Task")
            
            guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
                
                return
            }
            
            self.imageLoad(data: data!)
            
        })
        task.resume()
    }
    
    func imageLoad(data: Data) {
        DispatchQueue.main.async(execute: {
            print("Dispatch Queue")
            print("DATA \(data.description)")
            self.sampleView.photoView.image = UIImage(data: data)
            self.sampleView.reloadInputViews()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

