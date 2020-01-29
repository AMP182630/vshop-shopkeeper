//
//  GetOTPVC.swift
//  VShopUser
//
//  Created by Tushar Amkar on 22/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit
import SideMenuSwift
import SwiftyJSON

class GetOTPVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var btnresendOTP: UIButton!
    @IBOutlet weak var btnlogIn: UIButton!
    
    //MARK:- Variables -
    
    var phoneNumber = String()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationController?.isNavigationBarHidden = true
        self.txtOTP.delegate = self
    }
    
    //MARK:- Action -
    
    @IBAction func btnlogIn(_ sender: Any) {
        if txtOTP.text?.count == 0{
            Utility.showAlert(message: "Please enter OTP", controller: self) { (true) in}
        }
        else{
            Constant.General.userdefaults.set("12345", forKey: "otpVerify")
            let rootViewController = Storyboard.salescallLog.instantiate(viewController: SideMenuController.self)
            let controller = Storyboard.salescallLog.instantiate(viewController: SalesSideBar.self)
            rootViewController?.contentViewController = controller
            self.navigationController?.pushViewController(rootViewController ?? self, animated: true)
        }
    }
    @IBAction func btnresendOTP(_ sender: Any){
        
    }
}

//MARK:- Textfield Delegate -
extension GetOTPVC: UITextFieldDelegate{

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtOTP{
            return range.location < 6
        }
        return true
    }
}

extension GetOTPVC {
    
    //MARK:- API OTP
    
    public func apiOTP(){
        let params = [
            kOTPNUmber: txtOTP.text,
            kIMEI: Constant.udid.deviceUdid,
            kPhoneNumber: phoneNumber,
            kDeviceType:Constant.DeviceToken.deviceToken,
            kDeviceType: 1
            ] as [String : AnyObject]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    dictList = UserModel.init(dict: data)
                    let rootViewController = Storyboard.main.instantiate(viewController: SideMenuController.self)
                    let controller = Storyboard.main.instantiate(viewController: SalesExecutiveVC.self)
                    rootViewController?.contentViewController = controller
                    self.navigationController?.pushViewController(rootViewController ?? self, animated: true)
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
