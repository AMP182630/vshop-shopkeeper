//
//  AddVideoVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON

class AddVideoVC: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //MARK:- Outlets -
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtvideoLink: UITextField!
    @IBOutlet weak var txtvideofilePath: UITextField!
    @IBOutlet weak var topFilepath: NSLayoutConstraint!
    @IBOutlet weak var lblfilePath: UILabel!
    @IBOutlet weak var lblSaperetor: UILabel!
    @IBOutlet weak var btnuploadVideo: UIButton!
    @IBOutlet weak var topuploadVideo: NSLayoutConstraint!
    @IBOutlet weak var heighttxtFIlepath: NSLayoutConstraint!
    
    //MARK:- Variables -
    
    var imagePicker: UIImagePickerController!
    var pickerController = UIImagePickerController()
    var videofilepathURL = NSURL()
    var showVideoimg = UIImage()
    var videoURLString = String()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = LocalisationStrings.NavigationTitle.addVideo
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        txtvideoLink.delegate = self
        txtvideofilePath.isHidden = true
        lblfilePath.isHidden = true
        lblSaperetor.isHidden = true
        topFilepath.constant = 0
        topuploadVideo.constant = 15
        heighttxtFIlepath.constant = 0
    }
    
    //MARK:- Actions -
    
    @IBAction func btnuploadVideo(_ sender: Any) {
        // Create the alert controller
        let alertController = UIAlertController(title: "", message: "Add Photo", preferredStyle: .actionSheet)
        
        // Create the actions
        let libraryAction = UIAlertAction(title: "Open photo Library", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.openGallary()
            NSLog("Open Photo Library")
        }
        let cameraAction = UIAlertAction(title: "Open Camera", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.openCamera()
            NSLog("Open Camera Pressed")
        }
        let cancelAction = UIAlertAction(title: "Cancle", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(libraryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func btnSubmit(_ sender: Any) {
        
    }
    
    //MARK:- TEXT VIEW DELEGATE -
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if self.txtvideoLink.text!.count > 0 {
            btnuploadVideo.backgroundColor = UIColor.blue
        }else{
            btnuploadVideo.backgroundColor = UIColor.init(red: 20/255, green: 11/255, blue: 116/255, alpha: 1)
        }
        return true
    }
    //    private func textViewDidEndEditing(_ textView: UITextView) {
    //        if txtvideoLink.text!.count > 0{
    //            btnuploadVideo.backgroundColor = UIColor.blue
    //        }else{
    //            btnuploadVideo.backgroundColor = UIColor.init(red: 20/255, green: 11/255, blue: 116/255, alpha: 1)
    //        }
    //    }
    
    //MARK:- ThumbnailImage from URL -
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    //MARK:- Imagepicker Delegate -
    
    func openGallary()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
        {
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
            pickerController.mediaTypes = ["public.movie"]
            pickerController.allowsEditing = true
            pickerController.modalPresentationStyle = .overFullScreen
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            let alert  = UIAlertController(title: "VShop", message: LocalisationStrings.AlertMessage.donthaveCamera, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL{
            print(videoURL)
            videofilepathURL = videoURL as NSURL
            let thumbnailImage = getThumbnailImage(forUrl: videoURL)
            showVideoimg = thumbnailImage ?? #imageLiteral(resourceName: "imgPlaceholder")
            showVideoimg = thumbnailImage ?? #imageLiteral(resourceName: "imgPlaceholder")
            txtvideofilePath.isHidden = false
            lblfilePath.isHidden = false
            lblSaperetor.isHidden = false
            topFilepath.constant = 30
            topuploadVideo.constant = 15
            heighttxtFIlepath.constant = 45
            do {
                self.videoURLString = try String(contentsOf: videoURL)
                txtvideofilePath.text = videoURLString
            } catch  {
                print("Catch")
            }
        }
        else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
//extension AddVideoVC {
//
//    public func apiSendInvitation(){
//        let params = [
//            kUserId : dictList?.userId ?? 0,
//            kvideoName: txtName.text ?? "",
//            kvideoUrl: videoURLString,
//            klanguauge: "en"
//            ] as [String : AnyObject]
//        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
//            let jsonData = JSON(response)
//            if jsonData[kSuccess] == true {
//                if let data = jsonData[kData].dictionary {
//                    print(data)
//                    Utility.showAlert(message: LocalisationStrings.AlertMessage.invitationSendSuccessfully, controller: self, alertComplition: { (action) in
//                    })
//                }
//            } else {
//                if let message = jsonData["message"].string {
//                    if message.count > 0{
//                        Utility.showAlert(message: message, controller: self, alertComplition: { (action) in
//                        })
//                    }
//                }
//            }
//        })
//        { (error) in
//            Utility.showAlert(message: error.localizedDescription, controller: self, alertComplition: { (completion) in
//            })
//        }
//    }
//}
