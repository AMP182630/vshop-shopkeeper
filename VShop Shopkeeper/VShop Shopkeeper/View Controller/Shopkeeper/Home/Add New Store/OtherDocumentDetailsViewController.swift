//
//  OtherDocumentDetailsViewController.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 25/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class OtherDocumentDetailsViewController: UIViewController,PassImgDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet var otherDocumentDetailsView: UIView!
    
    //MARK:- Variables -
    
    var arrImages = [UIImage]()
    var imgPickerObj = ImagePicker()
    var selectedTag = Int()
    var document : Documents = Documents()
    
    //MARK:- Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewConfiguration()
    }
    
    //MARK:- Setup Methods -
    
    fileprivate func viewConfiguration() {
        let otherDocumentView : Documents = Bundle.main.loadNibNamed("Documents", owner: nil, options: nil)![0] as! Documents
        Utility.applyViewShadow(view: otherDocumentView.frontOfDocumentView)
        Utility.applyViewShadow(view: otherDocumentView.backOfDocumentView)
        otherDocumentView.documentDetailsLabel.text = "Other Document Details"
        otherDocumentView.documentNumberLabel.text = "Other Document Number"
        self.document = otherDocumentView
        otherDocumentDetailsView.addSubview(otherDocumentView)
        otherDocumentView.frontButton.addTarget(self, action: #selector(clickFrontImg(sender:)), for: .touchUpInside)
        otherDocumentView.backButton.addTarget(self, action: #selector(clickBackImg(sender:)), for: .touchUpInside)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = "Other Document Details"
    }
    
    //MARK:- Actions -
    @IBAction func btnNotification(_ sender: UIBarButtonItem) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        if document.documentNumberTextField.text?.count == 0{
            Utility.showAlert(message: "Please enter Other Document Number", controller: self) { (true) in}
        }else if document.frontOfDocumentImage?.image == nil{
            Utility.showAlert(message: "Please Add Front Other Document Image", controller: self) { (true) in}
        }else if document.backOfDocumentImage?.image == nil{
            Utility.showAlert(message: "Please Add Back Other Document Image", controller: self) { (true) in}
        }else{
            let otherDocumentsVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreImageViewController") as! StoreImageViewController
            self.navigationController?.pushViewController(otherDocumentsVC, animated: true)
        }
    }
    @objc func clickFrontImg(sender: UIButton!) {
        delegate = self
        imgPickerObj.currentViewController = self
        selectedTag = 0
        imgPickerObj.actionSheet()
    }
    @objc func clickBackImg(sender: UIButton!) {
        delegate = self
        imgPickerObj.currentViewController = self
        selectedTag = 1
        imgPickerObj.actionSheet()
    }
    
    //MARK:- DELEGATE FOR SELECTED IMAGE -
    
    public func selectedImage(image: UIImage) {
        if selectedTag == 0{
            self.document.frontOfDocumentImage.image = image
        }else{
            self.document.backOfDocumentImage.image = image
        }
        
    }
}
