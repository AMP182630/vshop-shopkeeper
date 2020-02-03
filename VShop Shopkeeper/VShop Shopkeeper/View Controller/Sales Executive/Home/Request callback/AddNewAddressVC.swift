//
//  AddNewAddressVC.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 24/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit
import SwiftyJSON

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
        self.navigationItem.title = LocalisationStrings.NavigationTitle.addnewAddress
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
        if txtaddressLine1.text?.count == 0{
            Utility.showAlert(message: "Please enter Address", controller: self) { (true) in}
        }else if txtaddressLine2.text?.count == 0{
            Utility.showAlert(message: "Please enter Address", controller: self) { (true) in}
        }else if txtCity.text?.count == 0{
            Utility.showAlert(message: "Please enter City", controller: self) { (true) in}
        }else if txtState.text?.count == 0{
            Utility.showAlert(message: "Please enter State", controller: self) { (true) in}
        }else if txtCountry.text?.count == 0{
            Utility.showAlert(message: "Please enter County", controller: self) { (true) in}
        }else if txtpinCode.text?.count == 0{
            Utility.showAlert(message: "Please enter Pin Code", controller: self) { (true) in}
        }else{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
}
extension AddNewAddressVC {
    
    //MARK:- API REGISTER
    
    public func apiRegister(){
        let params : [String : Any] = [
            kUserId : dictList?.userId ?? 0,
            kaddress : "\(txtaddressLine1.text ?? "") \(txtaddressLine2.text ?? "")",
            kcity : txtCity.text ?? "",
            kcountry : txtCountry.text ?? "",
            kstate : txtState.text ?? "",
            kpinCode : txtpinCode.text ?? ""
            ]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    let nav = self.storyboard?.instantiateViewController(withIdentifier: "GetOTPVC") as! GetOTPVC
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
