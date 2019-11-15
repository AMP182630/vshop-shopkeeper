//
//  AddSalesExecutiveVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class AddSalesExecutiveVC: UIViewController,UITextFieldDelegate,PassImgDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtcontactNum: UITextField!
    @IBOutlet weak var txtpassWord: UITextField!
    
    //MARK:- Variables -
    
    var imgPickerObj = ImagePicker()
    
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
        self.navigationItem.title = "Add Sales Executive"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        txtcontactNum.delegate = self
    }
    
    //MARK:- Action -
    
    @IBAction func btnaddProfile(_ sender: Any) {
        delegate = self
        imgPickerObj.currentViewController = self
        imgPickerObj.actionSheet()
    }
    @IBAction func btncreateUser(_ sender: Any) {
        if txtName.text?.count == 0{
            Utility.showAlert(message: "Please enter name", controller: self) { (true) in}
        }else if txtcontactNum.text?.count == 0{
            Utility.showAlert(message: "Please enter contact number", controller: self) { (true) in}
        }
        else if txtcontactNum.text!.count < 10{
            Utility.showAlert(message: "Please enter valid contact number", controller: self) { (true) in}
        }else if txtpassWord.text?.count == 0{
            Utility.showAlert(message: "Please enter password", controller: self) { (true) in}
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK:- DELEGATE FOR SELECTED IMAGE -
    
    func selectedImage(image: UIImage) {
        imgProfile.image = image
    }
    
    //MARK:- Textfield Delegate -
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtcontactNum{
            return range.location < 10
        }
        return true
    }
}
