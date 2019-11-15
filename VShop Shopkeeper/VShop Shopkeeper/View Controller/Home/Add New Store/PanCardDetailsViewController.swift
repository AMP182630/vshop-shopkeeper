//
//  PanCardDetailsViewController.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 24/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class PanCardDetailsViewController: UIViewController,PassImgDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet var panCardDetailsView: UIView!
    
    
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
        let panCardView : Documents = Bundle.main.loadNibNamed("Documents", owner: nil, options: nil)![0] as! Documents
        Utility.applyViewShadow(view: panCardView.frontOfDocumentView)
        Utility.applyViewShadow(view: panCardView.backOfDocumentView)
        panCardView.documentDetailsLabel.text = "PAN Card Details"
        panCardView.documentNumberLabel.text = "PAN Number"
        self.document = panCardView
        panCardDetailsView.addSubview(panCardView)
        panCardView.frontButton.addTarget(self, action: #selector(clickFrontImg(sender:)), for: .touchUpInside)
        panCardView.backButton.addTarget(self, action: #selector(clickBackImg(sender:)), for: .touchUpInside)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = "PAN Card Details"
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    //MARK:- Actions -
    
    @IBAction func nextButton(_ sender: UIButton) {
        if document.documentNumberTextField.text?.count == 0{
            Utility.showAlert(message: "Please enter Pancard Number", controller: self) { (true) in}
        }else if document.frontOfDocumentImage?.image == nil{
            Utility.showAlert(message: "Please Add Front Pancard Image", controller: self) { (true) in}
        }else if document.backOfDocumentImage?.image == nil{
            Utility.showAlert(message: "Please Add Back Pancard Image", controller: self) { (true) in}
        }else{
            let gstCeriVC = self.storyboard?.instantiateViewController(withIdentifier: "GSTCretificatesDetailsViewController") as! GSTCretificatesDetailsViewController
            self.navigationController?.pushViewController(gstCeriVC, animated: true)
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
