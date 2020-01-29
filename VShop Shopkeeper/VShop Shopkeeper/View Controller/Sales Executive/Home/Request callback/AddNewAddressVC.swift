//
//  AddNewAddressVC.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 24/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class AddNewAddressVC: UIViewController,UITextFieldDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var lblvideocallTime: UILabel!
    @IBOutlet weak var btncurrentLocation: UIButton!
    @IBOutlet weak var txtaddressLine1: UITextField!
    @IBOutlet weak var txtaddressLine2: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtpinCode: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = "Add New Address"
        txtaddressLine1.delegate = self
        txtaddressLine2.delegate = self
        txtCity.delegate = self
        txtState.delegate = self
        txtCountry.delegate = self
        txtpinCode.delegate = self
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK:- Action -
    
    @IBAction func btncurrentLocation(_ sender: Any) {
    }
    @IBAction func btnSubmit(_ sender: Any) {
        if txtaddressLine1.text == "" &&  txtaddressLine1.text == nil {
            Utility.showAlert(message: "Please enter Address", controller: self) { (true) in}
        }else if txtaddressLine2.text == "" &&  txtaddressLine2.text == nil {
            Utility.showAlert(message: "Please enter Address", controller: self) { (true) in}
        }else if txtCity.text == "" &&  txtCity.text == nil {
            Utility.showAlert(message: "Please enter City", controller: self) { (true) in}
        }else if txtState.text == "" &&  txtState.text == nil {
            Utility.showAlert(message: "Please enter State", controller: self) { (true) in}
        }else if txtCountry.text == "" &&  txtCountry.text == nil {
            Utility.showAlert(message: "Please enter County", controller: self) { (true) in}
        }else if txtpinCode.text == "" &&  txtpinCode.text == nil {
            Utility.showAlert(message: "Please enter Pin Code", controller: self) { (true) in}
        }else{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
}
