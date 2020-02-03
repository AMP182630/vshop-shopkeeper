//
//  SalesProfileVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift
import SwiftyJSON

class SalesProfileVC: UIViewController,UITextFieldDelegate, PassImgDelegate {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnprofile: UIButton!
    @IBOutlet weak var txtfirstName: UITextField!
    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var txtphoneNum: UITextField!
    
    //MARK:- Variables -
    
    var imgPickerObj = ImagePicker()
    var profileDetails = NSMutableArray()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = LocalisationStrings.NavigationTitle.profile
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
        txtfirstName.isUserInteractionEnabled = false
        txtlastName.isUserInteractionEnabled = false
        txtphoneNum.isUserInteractionEnabled = false
    }
    
    func getData() {
        profileDetails = [
            dictList?.ownerFirstName ?? "",
            dictList?.ownerLastName ?? "",
            dictList?.mobileNumber ?? ""
        ]
    }
    
    //MARK:- Action -
    
    @IBAction func btnNotification(_ sender: Any) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
    @IBAction func btnProfile(_ sender: Any) {
        delegate = self
        imgPickerObj.currentViewController = self
        imgPickerObj.actionSheet()
    }
    @IBAction func btnsideMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    
    //MARK:- DELEGATE FOR SELECTED IMAGE -
    
    public func selectedImage(image: UIImage) {
        imgProfile.image = image
    }
}
extension SalesProfileVC {
    
    //MARK:- GET PROFILE DATA
    
    fileprivate func apiGetProfile() {
        let userId = UserDefaults.standard.value(forKey:"user_id") as? Int ?? 0
        RequestManager.getAPIWithURLString(urlPart:"\("")\(userId)",successResult: { (response,statuscode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let dict = jsonData[kData].dictionary {
                    dictList = UserModel.init(dict: dict)
                    self.getData()
                }
            } else {
                if let messages = jsonData["error"].string {
                    if messages.count > 0{
                        Utility.showAlert(message: messages, controller: self, alertComplition: { (action) in
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
