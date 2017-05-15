//
//  ViewController.swift
//  NewTest
//
//  Created by ESS Mac Pro on 4/28/17.
//  Copyright © 2017 NGA Group Inc. All rights reserved.
//

import UIKit
import BVCropPhoto
//import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,BVCropViewControllerDelegate {
    
//    var library = PHPhotoLibrary()
    var imagev : UIImage? = nil
    var image2:UIImage? = nil
//    var imageEditor = EditViewController()
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnUse: UIButton!
    @IBOutlet var btnPhoto: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        let delay = DispatchTime.now() + 0.0
        DispatchQueue.main.asyncAfter(deadline: delay){
            self.showActionSheet()
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionUse(_ sender: UIButton) {
        
        
        
    }

    func showActionSheet() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: "Choose from library", style: .default, handler: { (action) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photo from Facebook", style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: "Photo from Instagram", style: .default, handler: { (action) in
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            
        }))
        present(alert, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagev = image
       imageView.image = image
        picker.dismiss(animated: true, completion: nil)
//        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func usePhoto(_ sender: UIButton) {
        
       let controller = BVCropViewController()
        controller.cropSize = CGSize(width: view.frame.size.width - 32, height: view.frame.size.width - 32)
        controller.cropPhotoView.maximumZoomScale = 0.0
//        controller.cropPhotoView.updateOverlayView(BVCropPhotoOverlayView(cropSize: CGSize(width: view.frame.size.width - 32, height: view.frame.size.width - 32)))
        controller.delegate = self
        controller.sourceImage = imagev
        let navigationController = UINavigationController(rootViewController: controller)
        present(navigationController, animated: true, completion:nil)
    }
    
    func cropViewControllerDidCrop(_ sender: BVCropViewController!, croppedImage: UIImage!) {
        imageView.image = croppedImage
        sender.navigationController?.dismiss(animated: true, completion: nil)
    }

}

