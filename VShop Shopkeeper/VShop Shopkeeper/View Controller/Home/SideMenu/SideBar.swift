//
//  SideMenuController.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 22/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class SideBar: UIViewController {

    //MARK:- Outlets -
    
    @IBOutlet var menuListTableView: UITableView!
    @IBOutlet var hideMenuView: UIView!
    
    //MARK:- Public Variables -
    
    let menuList = ["Sales Executive","Order History","Invite","Staff Performance","Profile","Logout"]
    
    //MARK:- Life Cycle Methods -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewConfiguration()
    }
    
    //MARK:- Setup Methods -
    
    fileprivate func viewConfiguration() {
        menuListTableView.delegate = self
        menuListTableView.dataSource = self
        let menuListNib = UINib.init(nibName: "MenuTableViewCell", bundle: nil)
        self.menuListTableView.register(menuListNib, forCellReuseIdentifier: "MenuTableViewCell")
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
        let menuListCell = menuListTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
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
        } else if indexPath.row == 2{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "Invite", bundle: nil).instantiateViewController(withIdentifier: "InviteVC") }, with: "InviteVC")
            sideMenuController?.setContentViewController(with: "InviteVC")
        } else if indexPath.row == 3{
            sideMenuController?.cache(viewControllerGenerator: {
                UIStoryboard.init(name: "Staff Performance", bundle: nil).instantiateViewController(withIdentifier: "StaffPerformanceVC") }, with: "StaffPerformanceVC")
            sideMenuController?.setContentViewController(with: "StaffPerformanceVC")
        } else if indexPath.row == 4{
            sideMenuController?.cache(viewControllerGenerator: {
                UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") }, with: "ProfileVC")
            sideMenuController?.setContentViewController(with: "ProfileVC")
        }else{
            
        }
    }
}
