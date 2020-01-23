
//
//  InviteVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 15/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift
import SwiftyJSON

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
        self.navigationItem.title = LocalisationStrings.NavigationTitle.inviteTitle
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
        txtcontactNum.delegate = self
    }
    
    private func validate() -> Bool {
        if txtfirstName.text?.count == 0{
            Utility.showAlert(message: LocalisationStrings.AlertMessage.PleaseEnterFirstName, controller: self) { (true) in}
            return false
        }else if txtcontactNum.text?.count == 0{
            Utility.showAlert(message: LocalisationStrings.AlertMessage.PleaseEnterContactNumber, controller: self) { (true) in}
            return false
        }
        else if txtcontactNum.text!.count < 10{
            Utility.showAlert(message: LocalisationStrings.AlertMessage.PleaseEnterValidMobileNumber, controller: self) { (true) in}
            return false
        }else if txtEmail.text?.count == 0{
            Utility.showAlert(message:LocalisationStrings.AlertMessage.pleaseEnterEmail , controller: self) { (true) in}
            return false
        }
        return true
    }
    
    //MARK:- Actions -
    
    @IBAction func btnMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
    @IBAction func btnsendInvitation(_ sender: Any) {
        if validate(){
//            apiSendInvitation()
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
extension InviteVC {
        
    public func apiSendInvitation(){
        let params = [
            kUserId : dictList?.userId ?? 0,
            kuserName: txtfirstName.text ?? "",
            kuserNumber: txtcontactNum.text ?? "",
            kuserEmail: txtEmail.text ?? "",
            klanguauge: "en"
            ] as [String : AnyObject]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    Utility.showAlert(message: LocalisationStrings.AlertMessage.invitationSendSuccessfully, controller: self, alertComplition: { (action) in
                    })
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
