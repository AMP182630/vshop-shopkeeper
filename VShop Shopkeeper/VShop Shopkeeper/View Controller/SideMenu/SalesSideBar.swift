//
//  SalesSideBar.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class SalesSideBar: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet var menuListTableView: UITableView!
    @IBOutlet var hideMenuView: UIView!
    
    //MARK:- Public Variables -
    
    let menuList = ["Call Log","Order History","Request Call back","Check Rating Review","Advertise Video","Profile","Logout"]
    
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

extension SalesSideBar : UITableViewDataSource,UITableViewDelegate {
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
           sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "SalesCallLog", bundle: nil).instantiateViewController(withIdentifier: "SalesCallLogVC") }, with: "SalesCallLogVC")
            sideMenuController?.setContentViewController(with: "SalesCallLogVC")
        }else if indexPath.row == 1{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "SalesOrderHistory", bundle: nil).instantiateViewController(withIdentifier: "SalesOrderHistoryVC") }, with: "SalesOrderHistoryVC")
            sideMenuController?.setContentViewController(with: "SalesOrderHistoryVC")
        }else if indexPath.row == 2{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "SalesRequestCallback", bundle: nil).instantiateViewController(withIdentifier: "SalesRequestcallbackVC") }, with: "SalesRequestcallbackVC")
            sideMenuController?.setContentViewController(with: "SalesRequestcallbackVC")
        }else if indexPath.row == 3{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "SalesRatingsAndReview", bundle: nil).instantiateViewController(withIdentifier: "SalesRatingVC") }, with: "SalesRatingVC")
            sideMenuController?.setContentViewController(with: "SalesRatingVC")
        } else if indexPath.row == 4{
            sideMenuController?.cache(viewControllerGenerator: { UIStoryboard.init(name: "SalesAdvertiseVideo", bundle: nil).instantiateViewController(withIdentifier: "SalesAdvertiseVideoVC") }, with: "SalesAdvertiseVideoVC")
            sideMenuController?.setContentViewController(with: "SalesAdvertiseVideoVC")
        } else if indexPath.row == 5{
            sideMenuController?.cache(viewControllerGenerator: {
                UIStoryboard.init(name: "SalesProfile", bundle: nil).instantiateViewController(withIdentifier: "SalesProfileVC") }, with: "SalesProfileVC")
            sideMenuController?.setContentViewController(with: "SalesProfileVC")
        }else{
            
        }
    }
}
