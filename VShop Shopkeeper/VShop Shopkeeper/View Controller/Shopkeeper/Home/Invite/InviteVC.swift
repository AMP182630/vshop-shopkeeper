
//
//  InviteVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 15/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift

class InviteVC: UIViewController,UITextFieldDelegate{

    //MARK:- Outlets -
    
    @IBOutlet weak var txtfirstName: UITextField!
    @IBOutlet weak var txtcontactNum: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnsendInvitation: UIButton!
    
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
        self.navigationItem.title = "Invite"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
        txtcontactNum.delegate = self
    }
    
    //MARK:- Actions -
    
    @IBAction func btnMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
    }
    @IBAction func btnsendInvitation(_ sender: Any) {
        if txtfirstName.text?.count == 0{
            Utility.showAlert(message: "Please enter first name", controller: self) { (true) in}
        }else if txtcontactNum.text?.count == 0{
            Utility.showAlert(message: "Please enter contact number", controller: self) { (true) in}
        }
        else if txtcontactNum.text!.count < 10{
            Utility.showAlert(message: "Please enter valid contact number", controller: self) { (true) in}
        }else if txtEmail.text?.count == 0{
            Utility.showAlert(message: "Please enter email address", controller: self) { (true) in}
        }
        else{
//            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK:- Textfield Delegate -
       
       func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           if textField == txtcontactNum{
               return range.location < 10
           }
           return true
       }
}
