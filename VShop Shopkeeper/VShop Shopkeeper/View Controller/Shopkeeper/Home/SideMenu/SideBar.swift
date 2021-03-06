//
//  SideMenuController.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 22/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit
import SwiftyJSON

class SideBar: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet var menuListTableView: UITableView!
    @IBOutlet var hideMenuView: UIView!
    
    //MARK:- Public Variables -
    
    let menuList = ["Sales Executive","Order History","Call Log","Request Call back","Invite","Staff Performance","Rating & Review","Advertise Video","Profile","Logout"]
    
    //MARK:- Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewConfiguration()
    }
    
    //MARK:- Setup Methods -
    
    fileprivate func viewConfiguration() {
        menuListTableView.delegate = self
        menuListTableView.dataSource = self
        let menuListNib = UINib.init(nibName: MenuTableViewCell.staticIdentifier, bundle: nil)
        self.menuListTableView.register(menuListNib, forCellReuseIdentifier: MenuTableViewCell.staticIdentifier)
        self.menuListTableView.tableFooterView = UIView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        hideMenuView.addGestureRecognizer(tap)
    }
    
    //MARK:- Action -
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.sideMenuController?.hideMenu()
    }
    
    //MARK:- Functions -
    
    
}

//MARK:- TableView Delegate & DataSource -

extension SideBar : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuListCell = menuListTableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.staticIdentifier, for: indexPath) as! MenuTableViewCell
        menuListCell.menuListLabel.text = menuList[indexPath.row]
        return menuListCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.sideMenuController?.hideMenu()
        if indexPath.row == 0 {
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SalesExecutiveVC") }, with: "SalesExecutiveVC")
            sideMenuController?.setContentViewController(with: "SalesExecutiveVC")
        }else if indexPath.row == 1{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "OrderHistory", bundle: nil).instantiateViewController(withIdentifier: "OrderHistoryVC") }, with: "OrderHistoryVC")
            sideMenuController?.setContentViewController(with: "OrderHistoryVC")
        }else if indexPath.row == 2{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "CallLog", bundle: nil).instantiateViewController(withIdentifier: "CallLogVC") }, with: "CallLogVC")
            sideMenuController?.setContentViewController(with: "CallLogVC")
        }else if indexPath.row == 3{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "RequestCallback", bundle: nil).instantiateViewController(withIdentifier: "RequestCallbackVC") }, with: "RequestCallbackVC")
            sideMenuController?.setContentViewController(with: "RequestCallbackVC")
        } else if indexPath.row == 4{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "Invite", bundle: nil).instantiateViewController(withIdentifier: "InviteVC") }, with: "InviteVC")
            sideMenuController?.setContentViewController(with: "InviteVC")
        } else if indexPath.row == 5{
            sideMenuController?.cache(viewControllerGenerator: {
                UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SalesExecutiveVC") }, with: "SalesExecutiveVC")
            sideMenuController?.setContentViewController(with: "SalesExecutiveVC")
        }else if indexPath.row == 6{
            sideMenuController?.cache(viewControllerGenerator: {
                UIStoryboard.init(name: "RatingsAndReview", bundle: nil).instantiateViewController(withIdentifier: "RatingReviewsVC") }, with: "RatingReviewsVC")
            sideMenuController?.setContentViewController(with: "RatingReviewsVC")
        }else if indexPath.row == 7{
            sideMenuController?.cache(viewControllerGenerator: {
                UIStoryboard.init(name: "AdvertiseVideo", bundle: nil).instantiateViewController(withIdentifier: "AdvertiseVideoVC") }, with: "AdvertiseVideoVC")
            sideMenuController?.setContentViewController(with: "AdvertiseVideoVC")
        } else if indexPath.row == 8{
            sideMenuController?.cache(viewControllerGenerator: {
                UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") }, with: "ProfileVC")
            sideMenuController?.setContentViewController(with: "ProfileVC")
        }else{
            Utility.showAlertWithTwoBtns(messgae: LocalisationStrings.AlertMessage.logout, controller: self) { (action) in
                if action == true {
                    //apiLogout()
                    let nav = Constant.Storyboards.Login.instantiateViewController(withIdentifier: "loginNavigationVC")
                    Constant.General.userdefaults.removeObject(forKey: "otpVerify")
                    appDelegate.window?.rootViewController = nav
                }
            }
            
        }
    }
}

extension SideBar {
    
    //MARK:- API LOGOUT
    
    fileprivate func apiLogout() {
        let params = [
            kUserId:UserDefaults.standard.value(forKey:"user_id") as? Int ?? 0,
            kDeviceToken: Constant.DeviceToken.deviceToken,
            kDeviceType: 1
            ] as [String : AnyObject]
        RequestManager.postAPIWithHeader(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                let nav = Constant.Storyboards.Login.instantiateViewController(withIdentifier: "loginNavigationVC")
                Constant.General.userdefaults.removeObject(forKey: "otpVerify")
                appDelegate.window?.rootViewController = nav
            }
        })
        { (error) in
            Utility.showAlert(message: error.localizedDescription, controller: self, alertComplition: { (completion) in
                
            })
        }
    }
}
