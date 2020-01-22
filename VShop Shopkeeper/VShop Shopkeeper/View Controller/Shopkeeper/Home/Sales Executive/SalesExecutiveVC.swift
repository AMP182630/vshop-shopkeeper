//
//  SalesExecutiveVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift
import SwiftyJSON

class SalesExecutiveVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var name = ["Shubham","Neel","Parth","Akash","Tushar","Nimit","Nidhi"]
    var refreshControl = UIRefreshControl()
    var counter = 3
    public var arrSalesList = [SalesExecutiveModel]()
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
        self.navigationItem.title = "Sales Executive"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
        
        refreshControl.attributedTitle = NSAttributedString(string: Constant.defaultValues.PullToRefresh)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        tblView.addSubview(refreshControl)
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registersalesExecutiveCell = UINib(nibName: "SalesExecutiveCell", bundle: nil)
        self.tblView.register(registersalesExecutiveCell, forCellReuseIdentifier: "SalesExecutiveCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewsalesExecutive(cell : SalesExecutiveCell, indexPath : IndexPath) -> SalesExecutiveCell {
        cell.btnEdit.addTarget(self, action: #selector(edit(sender:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(delete(sender:)), for: .touchUpInside)
        cell.btnPermission.addTarget(self, action: #selector(permission(sender:)), for: .touchUpInside)
        cell.lblName.text = name[indexPath.row]
        return cell
    }
    
    //MARK:- Functions -
    
    fileprivate func pagination() {
        counter += 10
        tblView.reloadData()
    }
    
    //MARK:- Action -
    
    //MARK:- REFRESH SERVICES
    
    @objc func refresh(sender:AnyObject) {
        counter += 1
        self.page = 0
        tblView.reloadData()
        refreshControl.endRefreshing()
    }
    @objc func edit(sender: UIButton!) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
    @objc func delete(sender: UIButton!) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
    @objc func permission(sender: UIButton!) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "PermissionVC") as! PermissionVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
    @IBAction func btnsideMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
    @IBAction func btnaddExecutive(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "AddSalesExecutiveVC") as! AddSalesExecutiveVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
}

//MARK:- TableView Delgate and Datasource -

extension SalesExecutiveVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalesExecutiveCell") as! SalesExecutiveCell
        return populateTableViewsalesExecutive(cell: cell, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = counter - 1
        if indexPath.row == lastItem {
            pagination()
        }
    }
}

extension SalesExecutiveVC {
    
    //MARK:- API SALES EXECUTIVE LIST
    
    fileprivate func apiSaleExecutiveList() {
        let params = [
            kUserId:UserDefaults.standard.value(forKey:"user_id") as? Int ?? 0,
            "page":page
            ] as [String : AnyObject]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    self.totalRecords = data["totalRecords"]?.int ?? 0
                    if let arrList = data["stores"]?.array {
                        if arrList.count != 0 {
                            if self.page == 0 {
                                self.arrSalesList = arrList.compactMap({(dict) -> SalesExecutiveModel in SalesExecutiveModel(dict: dict.dictionaryValue)})
                            } else {
                                for dict in arrList {
                                    self.arrSalesList.append(SalesExecutiveModel(dict: dict.dictionaryValue))
                                }
                            }
                            self.tblView.reloadData()
                        }
                    }
                    self.refreshControl.endRefreshing()
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
