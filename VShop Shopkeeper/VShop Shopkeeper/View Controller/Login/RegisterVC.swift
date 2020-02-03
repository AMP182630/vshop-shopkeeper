//
//  RegisterVC.swift
//  VShopUser
//
//  Created by Tushar Amkar on 22/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit
import SwiftyJSON

class RegisterVC: UIViewController,UITextFieldDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtfirstName: UITextField!
    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var txtphoneNum: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnlogIn: UIButton!
    
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
        //        self.navigationItem.hidesBackButton = true
        txtphoneNum.delegate = self
    }
    
    //MARK:- Action -
    
    @IBAction func btnRegister(_ sender: Any) {
        if txtfirstName.text?.count == 0{
            Utility.showAlert(message: "Please enter FirstName", controller: self) { (true) in}
        }
        else if txtlastName.text?.count == 0{
            Utility.showAlert(message: "Please enter LastName", controller: self) { (true) in}
        }
        else if txtphoneNum.text?.count == 0{
            Utility.showAlert(message: "Please enter mobile number", controller: self) { (true) in}
        }
        else{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "GetOTPVC") as! GetOTPVC
            nav.phoneNumber = self.txtphoneNum.text ?? ""
            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
    @IBAction func btnlogIn(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    //MARK:- Textfield Delegate -
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtphoneNum{
            return range.location < 10
        }
        return true
    }
}

extension RegisterVC {
    
    //MARK:- API REGISTER
    
    public func apiRegister(){
        let params = [
            kFirstName: txtfirstName.text ?? "",
            kLastName: txtlastName.text ?? "",
            kPhoneNumber: txtphoneNum.text ?? "",
            kDeviceType: 1
            ] as [String : AnyObject]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    let nav = self.storyboard?.instantiateViewController(withIdentifier: "GetOTPVC") as! GetOTPVC
                    nav.phoneNumber = self.txtphoneNum.text ?? ""
                    self.navigationController?.pushViewController(nav, animated: true)
                }
            } else {
                if let message = jsonData["message"].string {
                    if message.count > 0{
                        Utility.showAlert(message: message, controller: self, alertComplition: { (action) in
                        })
                    }
                }
            }
        })
        { (error) in
            Utility.showAlert(message: error.localizedDescription, controller: self, alertComplition: { (completion) in
            })
        }
    }
}
