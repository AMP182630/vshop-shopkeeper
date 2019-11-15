//
//  ImagePicker.swift
//  GlamBolt
//
//  Created by Parth Patel on 04/07/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import UIKit
import OpalImagePicker

protocol PassImgDelegate {
    func selectedImage(image: UIImage)
}

protocol PassArrayImgDelegate {
    func selectedArrayImage(arrImg: [UIImage])
}

var delegate : PassImgDelegate?
var arrayImgdelegate : PassArrayImgDelegate?

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK:- VARIABLES
    
    var imagePicker = UIImagePickerController()
    var currentViewController = UIViewController()
    var arrImages : [UIImage] = []
    var cameFrom = String()
    
    //MARK:- ACTION SHEET
    
    func actionSheet() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        currentViewController.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- OPEN CAMERA
    
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.currentViewController.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.currentViewController.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- OPEN GALLERY
    
    func openGallary() {
        if cameFrom == "StoreImageViewController" {
            let imagePicker = OpalImagePickerController()
            imagePicker.imagePickerDelegate = self
            imagePicker.maximumSelectionsAllowed = 10
            imagePicker.modalPresentationStyle = .overFullScreen
            self.currentViewController.present(imagePicker, animated: true, completion: nil)
        }else{
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            imagePicker.modalPresentationStyle = .overFullScreen
            self.currentViewController.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //MARK:- IMAGE PICKER CONTROLLER DELEGATE
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            delegate?.selectedImage(image: pickedImage)
        }
        currentViewController.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentViewController.dismiss(animated: true, completion: nil)
    }
}
extension ImagePicker: OpalImagePickerControllerDelegate {
    func imagePickerDidCancel(_ picker: OpalImagePickerController) {
        //Cancel action?
    }
    
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage]) {
        //Save Images, update UI
        for i in images{
            arrImages.append(i)
        }
        //        arrImages = []
        //        var dict : [String:Any] = [:]
        //        for imageObj in images {
        //            dict["Image"] = imageObj
        //            arrImages.append(dict)
        //        }
        arrayImgdelegate?.selectedArrayImage(arrImg: arrImages)
        //Dismiss Controller
        self.currentViewController.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}
