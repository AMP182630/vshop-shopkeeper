//
//  LoginVC.swift
//  VShopUser
//
//  Created by Tushar Amkar on 22/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtphoneNumber: UITextField!
    @IBOutlet weak var btngetOTP: UIButton!
    @IBOutlet weak var btnnewUser: UIButton!
    
    //MARK:- Variables -
    
    
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationController?.isNavigationBarHidden = true
        txtphoneNumber.delegate = self
    }
    
    //MARK:- Action -
    
    @IBAction func btngetOTP(_ sender: Any) {
        if txtphoneNumber.text?.count == 0{
            Utility.showAlert(message: "Please enter mobile number", controller: self) { (true) in}
        }
        else if txtphoneNumber.text!.count < 10{
            Utility.showAlert(message: "Please enter valid mobile number", controller: self) { (true) in}
        }
        else{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "GetOTPVC") as! GetOTPVC
            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
    @IBAction func btnnewUser(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    //MARK:- Textfield Delegate -
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtphoneNumber{
            return range.location < 10
        }
        return true
    }
}
