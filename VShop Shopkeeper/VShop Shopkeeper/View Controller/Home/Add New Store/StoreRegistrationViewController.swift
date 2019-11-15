//
//  StoreRegistrationViewController.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 25/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class StoreRegistrationViewController: UIViewController,PassImgDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet var storeRegistrationDetailsView: UIView!
    
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
        let storeRegiView : Documents = Bundle.main.loadNibNamed("Documents", owner: nil, options: nil)![0] as! Documents
        Utility.applyViewShadow(view: storeRegiView.frontOfDocumentView)
        Utility.applyViewShadow(view: storeRegiView.backOfDocumentView)
        storeRegiView.documentDetailsLabel.text = "Store Registration Certi. Details"
        storeRegiView.documentNumberLabel.text = "Store Registration Number"
        self.document = storeRegiView
        storeRegistrationDetailsView.addSubview(storeRegiView)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = "Store Registration Certi. Details"
    }
    
    //MARK:- Actions -
    
    @IBAction func nextButton(_ sender: UIButton) {
        if document.documentNumberTextField.text?.count == 0{
            Utility.showAlert(message: "Please enter Store Registration Number", controller: self) { (true) in}
        }else if document.frontOfDocumentImage?.image == nil{
            Utility.showAlert(message: "Please Add Front Store Registration Certificate Image", controller: self) { (true) in}
        }else if document.backOfDocumentImage?.image == nil{
            Utility.showAlert(message: "Please Add Back Store Registration Certificate Image", controller: self) { (true) in}
        }else{
            let otherDocumentsVC = self.storyboard?.instantiateViewController(withIdentifier: "OtherDocumentDetailsViewController") as! OtherDocumentDetailsViewController
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
