//
//  PermissionVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class PermissionVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var permission = ["Order History ","Call Log","Request Call Back","Check Rating Review","Advertise Video"]
    var dictSaleExecutive : SalesExecutiveModel?
    fileprivate var selectedRows = NSMutableArray()
    var arrPermission = [PermissionsModel]()
    var refreshControl = UIRefreshControl()
    var counter = 3
    public var page = Int()
    public var totalRecords = Int()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXibs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //        apiGetPermissions()
        setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = LocalisationStrings.NavigationTitle.permission
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        refreshControl.attributedTitle = NSAttributedString(string: Constant.defaultValues.PullToRefresh)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        tblView.addSubview(refreshControl)
    }
    
    fileprivate func pagination() {
        counter += 10
        tblView.reloadData()
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registersalesPermissionCell = UINib(nibName: PermissionCell.staticIdentifier, bundle: nil)
        self.tblView.register(registersalesPermissionCell, forCellReuseIdentifier: PermissionCell.staticIdentifier)
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewPermissionCell(cell : PermissionCell, indexPath : IndexPath) -> PermissionCell {
        cell.lblPermission.text = permission[indexPath.row]
        if selectedRows.contains(permission[indexPath.row]) {
            cell.btnselectPermission.setImage(UIImage(named: "checkBox"), for: .normal)
        } else {
            cell.btnselectPermission.setImage(UIImage(named: "default"), for: .normal)
        }
        //        if selectedRows.contains(indexPath)
        //        {
        //            cell.btnselectPermission.setImage(UIImage(named: "checkBox"), for: .normal)
        //        }
        //        else{
        //            cell.btnselectPermission.setImage(UIImage(named: "default"), for: .normal)
        //        }
        cell.btnselectPermission.tag = indexPath.row
        cell.btnselectPermission.addTarget(self, action: #selector(selectPermission(sender:)), for: .touchUpInside)
        return cell
    }
    
    //MARK:- Action -
    
    @objc func refresh(sender:AnyObject) {
        counter += 1
        self.page = 0
        tblView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc func selectPermission(sender: UIButton!) {
        if self.selectedRows.contains(arrPermission[sender.tag].permissiontId) {
            self.selectedRows.remove(arrPermission[sender.tag].permissiontId)
        } else {
            self.selectedRows.add(arrPermission[sender.tag].permissiontId)
        }
        self.tblView.reloadData()
    }
    @IBAction func btnSubmit(_ sender: Any) {
        apiGivePermission()
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- TableView Delgate and Datasource -

extension PermissionVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permission.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PermissionCell.staticIdentifier) as! PermissionCell
        return populateTableViewPermissionCell(cell: cell, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = counter - 1
        if indexPath.row == lastItem {
            pagination()
        }
    }
}
extension PermissionVC {
    
    public func apiGivePermission(){
        let params : [String : Any]  = [
            kUserId: dictList?.userId ?? 0,
            ksalesId : dictSaleExecutive?.salesId ?? 0,
            kpermission : selectedRows
        ]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    self.navigationController?.popViewController(animated: true)
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
    
    fileprivate func apiGetPermissions()
    {
        RequestManager.getAPIWithURLString(urlPart: "",successResult: { (response,statuscode) in
            Utility.dismissGIF()
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let arrdata = jsonData[kData].array {
                    self.arrPermission = arrdata.compactMap({(dict) -> PermissionsModel in PermissionsModel(dict: dict.dictionaryValue)})
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
            Utility.dismissGIF()
            Utility.showAlert(message: error.localizedDescription, controller: self, alertComplition: { (completion) in
            })
        }
    }
}
