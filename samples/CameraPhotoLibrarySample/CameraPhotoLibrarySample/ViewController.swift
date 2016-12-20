//
//  ViewController.swift
//  CameraPhotoLibrarySample
//
//  Created by Ikarious on 2016. 11. 1..
//  Copyright © 2016년 heference. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let sampleView = SampleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Sample View Setting
        sampleView.frame = self.view.bounds
        self.view.addSubview(sampleView)
        
        sampleView.cameraButton.addTarget(self, action: #selector(self.cameraCall(sender: )), for: UIControlEvents.touchUpInside)
        sampleView.photoButton.addTarget(self, action: #selector(self.photoLibraryCall(sender: )), for: UIControlEvents.touchUpInside)
    }
    
    func cameraCall(sender: UIButton) {
        print("Camera Call")
        
        //Info.plist Privacy - Camera Usage Description 항목 설정 반드시 참고
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func photoLibraryCall(sender: UIButton) {
        print("Photo Library Call")
        //Info.plist Privacy - Photo Library Usage Description 항목 설정 반드시 참고
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        self.dismiss(animated: true, completion: nil)
//        if let cameraImage = info[UIImagePickerControllerOriginalImage] {
//            sampleView.photoView.image = cameraImage as? UIImage
//        } else if let albumImage = info[]
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.dismiss(animated: true, completion: nil)
        sampleView.photoView.image = image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

