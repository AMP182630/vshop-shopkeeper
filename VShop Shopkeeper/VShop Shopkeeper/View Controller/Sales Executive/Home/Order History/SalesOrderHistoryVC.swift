//
//  SalesOrderHistoryVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift

class SalesOrderHistoryVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXibs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = "Order History"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerOrderHistoryCell = UINib(nibName: "OrderHistoryCell", bundle: nil)
        self.tblView.register(registerOrderHistoryCell, forCellReuseIdentifier: "OrderHistoryCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewOrderHistoryCell(cell : OrderHistoryCell, indexPath : IndexPath) -> OrderHistoryCell {
//        cell.imgProduct.isHidden = true
//        cell.leadingName.constant = 4
//        cell.widthimgProduct.constant = 0
        return cell
    }
    
    //MARK:- Action -
    
    @IBAction func btnMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
    }
}
//MARK:- TableView Delgate and Datasource -

extension SalesOrderHistoryVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryCell") as! OrderHistoryCell
        return populateTableViewOrderHistoryCell(cell: cell, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "SalesOrderDetailVC") as! SalesOrderDetailVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
