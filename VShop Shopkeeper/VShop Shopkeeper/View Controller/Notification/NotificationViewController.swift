//
//  NotificationViewController.swift
//  VShopDeliverBoy
//
//  Created by Neel Purohit on 27/11/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit
import  SwiftyJSON

class NotificationViewController: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet var notificationTableView: UITableView!
    
    //MARK:- VARIABLES -
    
    var counter = 3
    public var arrNotificationList = [NotificationModel]()
    public var page = Int()
    public var totalRecords = Int()
    fileprivate var refreshControl = UIRefreshControl()
    
    //MARK:- Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewConfiguration()
    }
    
    //MARK:- Setup Methods -
    
    fileprivate func viewConfiguration() {
        self.notificationTableView.delegate = self
        self.notificationTableView.dataSource = self
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.title = "Notification"
        self.registerXIB()
        
        refreshControl.attributedTitle = NSAttributedString(string: Constant.defaultValues.PullToRefresh)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        notificationTableView.addSubview(refreshControl)
        //apiNotificationList()
    }
    
    //MARK:- Functions -
    
    fileprivate func registerXIB() {
        let NotificationTableViewCellTableViewCell = UINib(nibName: Constants.TableViewCell.NotificationTableViewCell, bundle: nil)
        self.notificationTableView.register(NotificationTableViewCellTableViewCell, forCellReuseIdentifier: Constants.TableViewCell.NotificationTableViewCell)
    }
    
    //MARK:- REFRESH SERVICES
    
    @objc func refresh(sender:AnyObject) {
        counter += 1
        self.page = 0
        notificationTableView.reloadData()
        refreshControl.endRefreshing()
        // apiNotificationList()
    }
    
    //MARK:- Populate Tableview Cell -
    
    fileprivate func populateTableViewNotificationCell(cell : NotificationTableViewCell, indexPath : IndexPath) -> NotificationTableViewCell {
        return cell
    }
    
    
    //MARK:- Actions -
    
    fileprivate func pagination() {
        counter += 10
        notificationTableView.reloadData()
    }
}

//MARK:- TableView Delegate & DataSource -

extension NotificationViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.NotificationTableViewCell) as! NotificationTableViewCell
        return populateTableViewNotificationCell(cell: cell, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = counter - 1
        if indexPath.row == lastItem {
            pagination()
        }
    }
}

extension NotificationViewController {
    
    //MARK:- API NOTIFICATION LIST
    
    fileprivate func apiNotificationList() {
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
                    if let arrList = data["notifications"]?.array {
                        if arrList.count != 0 {
                            if self.page == 0 {
                                self.arrNotificationList = arrList.compactMap({(dict) -> NotificationModel in NotificationModel(dict: dict.dictionaryValue)})
                            } else {
                                for dict in arrList {
                                    self.arrNotificationList.append(NotificationModel(dict: dict.dictionaryValue))
                                }
                            }
                            self.notificationTableView.reloadData()
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
