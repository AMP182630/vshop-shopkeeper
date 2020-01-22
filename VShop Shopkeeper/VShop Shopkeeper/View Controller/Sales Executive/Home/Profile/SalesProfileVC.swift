//
//  SalesProfileVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift

class SalesProfileVC: UIViewController,UITextFieldDelegate, PassImgDelegate {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnprofile: UIButton!
    @IBOutlet weak var txtfirstName: UITextField!
    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var txtphoneNum: UITextField!
    
    //MARK:- Variables -
    
    var imgPickerObj = ImagePicker()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = "Profile"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
        txtfirstName.isUserInteractionEnabled = false
        txtlastName.isUserInteractionEnabled = false
        txtphoneNum.isUserInteractionEnabled = false
    }
    
    //MARK:- Action -
    
    @IBAction func btnNotification(_ sender: Any) {
        
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
