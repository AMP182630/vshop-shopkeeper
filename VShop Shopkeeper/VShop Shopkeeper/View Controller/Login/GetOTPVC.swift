//
//  GetOTPVC.swift
//  VShopUser
//
//  Created by Tushar Amkar on 22/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit
import SideMenuSwift

class GetOTPVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var btnresendOTP: UIButton!
    @IBOutlet weak var btnlogIn: UIButton!
    
    //MARK:- Variables -
    
    
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
            let rootViewController = Storyboard.main.instantiate(viewController: SideMenuController.self)
            let controller = Storyboard.main.instantiate(viewController:SalesExecutiveVC.self)
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
