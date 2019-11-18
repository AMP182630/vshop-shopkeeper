//
//  AadharCardDetailsViewController.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 25/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class AadharCardDetailsViewController: UIViewController,PassImgDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet var aadharCardDetailsView: UIView!
    
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
        let aadharView : Documents = Bundle.main.loadNibNamed("Documents", owner: nil, options: nil)![0] as! Documents
        Utility.applyViewShadow(view: aadharView.frontOfDocumentView)
        Utility.applyViewShadow(view: aadharView.backOfDocumentView)
        aadharView.documentDetailsLabel.text = "Aadhar Card Details"
        aadharView.documentNumberLabel.text = "Aadhar Number"
        self.document = aadharView
        aadharCardDetailsView.addSubview(aadharView)
        aadharView.frontButton.addTarget(self, action: #selector(clickFrontImg(sender:)), for: .touchUpInside)
        aadharView.backButton.addTarget(self, action: #selector(clickBackImg(sender:)), for: .touchUpInside)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = "Aadhar Card Details"
    }
    
    //MARK:- Actions -
    
    @IBAction func nextButton(_ sender: UIButton) {
        if document.documentNumberTextField.text?.count == 0{
            Utility.showAlert(message: "Please enter Aadhar Card Number", controller: self) { (true) in}
        }else if document.frontOfDocumentImage?.image == nil{
            Utility.showAlert(message: "Please Add Front Aadhar Card Image", controller: self) { (true) in}
        }else if document.backOfDocumentImage?.image == nil{
            Utility.showAlert(message: "Please Add Back Aadhar Card Image", controller: self) { (true) in}
        }else{
            let storeRegiVC = self.storyboard?.instantiateViewController(withIdentifier: "StoreRegistrationViewController") as! StoreRegistrationViewController
            self.navigationController?.pushViewController(storeRegiVC, animated: true)
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
