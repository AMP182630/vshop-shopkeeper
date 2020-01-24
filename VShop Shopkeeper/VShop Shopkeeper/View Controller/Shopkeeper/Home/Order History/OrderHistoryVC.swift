//
//  OrderHistoryVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 15/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import  SideMenuSwift
import SwiftyJSON

class OrderHistoryVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var refreshControl = UIRefreshControl()
    var counter = 3
    public var arrOrderHistoryList = [OrderHistoryListModel]()
    public var page = Int()
    public var totalRecords = Int()
    
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
        self.navigationItem.title = LocalisationStrings.NavigationTitle.orderHistory
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
        
        refreshControl.attributedTitle = NSAttributedString(string: Constant.defaultValues.PullToRefresh)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        tblView.addSubview(refreshControl)
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerOrderHistoryCell = UINib(nibName: OrderHistoryCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerOrderHistoryCell, forCellReuseIdentifier: OrderHistoryCell.staticIdentifier)
    }
    
    //MARK:- Functions -
    
    fileprivate func pagination() {
        counter += 10
        tblView.reloadData()
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewOrderHistoryCell(cell : OrderHistoryCell, indexPath : IndexPath) -> OrderHistoryCell {
        /*    cell.lblName.text = arrOrderHistoryList[indexPath.row].customerName
         cell.lblorderId.text = arrOrderHistoryList[indexPath.row].customerOrderId
         cell.lblQuantity.text = arrOrderHistoryList[indexPath.row].quantity
         cell.lblPrice.text = arrOrderHistoryList[indexPath.row].price
         cell.lblorderProcess.text = arrOrderHistoryList[indexPath.row].status */
        return cell
    }
    
    //MARK:- Action -
    
    //MARK:- REFRESH SERVICES
    
    @objc func refresh(sender:AnyObject) {
        counter += 1
        self.page = 0
        tblView.reloadData()
        refreshControl.endRefreshing()
    }
    @IBAction func btnMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
}
//MARK:- TableView Delgate and Datasource -

extension OrderHistoryVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderHistoryCell.staticIdentifier) as! OrderHistoryCell
        return populateTableViewOrderHistoryCell(cell: cell, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailVC") as! OrderDetailVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = counter - 1
        if indexPath.row == lastItem {
            pagination()
        }
    }
}

extension OrderHistoryVC {
    
    //MARK:- API ORDER HISTORY LIST
    
    fileprivate func apiSalesExecutiveList() {
        let userId = UserDefaults.standard.value(forKey:"user_id") as? Int ?? 0
        RequestManager.getAPIWithURLString(urlPart:"\("")\(userId)",successResult: { (response,statuscode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let dict = jsonData[kData].dictionary {
                    self.totalRecords = dict[ktotalRecords]?.int ?? 0
                    if let arrList = dict["data"]?.array {
                        if arrList.count != 0 {
                            if self.page == 0 {
                                self.arrOrderHistoryList = arrList.compactMap({(dict) -> OrderHistoryListModel in OrderHistoryListModel(dict: dict.dictionaryValue)})
                            } else {
                                for dict in arrList {
                                    self.arrOrderHistoryList.append(OrderHistoryListModel(dict: dict.dictionaryValue))
                                }
                            }
                            self.tblView.reloadData()
                        }
                    }
                    self.refreshControl.endRefreshing()
                    
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
