//
//  LoginVC.swift
//  VShopUser
//
//  Created by Tushar Amkar on 22/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit
import SwiftyJSON

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

extension LoginVC {
    
    //MARK:- API LOGIN
    
    public func apiLogin(){
        let params = [
            kPhoneNumber: txtphoneNumber.text ?? "",
            kIMEI: Constant.udid.deviceUdid,
            klanguauge : "",
            kDeviceType: 1
            ] as [String : AnyObject]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    let nav = self.storyboard?.instantiateViewController(withIdentifier: "GetOTPVC") as! GetOTPVC
                    nav.phoneNumber = self.txtphoneNumber.text ?? ""
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
