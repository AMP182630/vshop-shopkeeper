//
//  AdvertiseVideoVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift
import SwiftyJSON

class AdvertiseVideoVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var refreshControl = UIRefreshControl()
    var counter = 3
    public var arrAdvertiseVideoList = [AdvertiseVideoModel]()
    public var dictAdvertiseVideoList : AdvertiseVideoModel?
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
        //        apiAdvertiseVideoList()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = LocalisationStrings.NavigationTitle.advertiseVideo
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = false
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
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
        let registerAdvertiseVideoCell = UINib(nibName: AdvertiseVideoCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerAdvertiseVideoCell, forCellReuseIdentifier: AdvertiseVideoCell.staticIdentifier)
    }
    
    func setupAPIData(){
        
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewAdvertiseVideoCell(cell : AdvertiseVideoCell, indexPath : IndexPath) -> AdvertiseVideoCell {
        cell.btnActive.addTarget(self, action: #selector(active(sender:)), for: .touchUpInside)
        cell.btnActive.tag = indexPath.row
        cell.btnplayVideo.addTarget(self, action: #selector(playVideo(sender:)), for: .touchUpInside)
        cell.btnplayVideo.tag = indexPath.row
        cell.btnDeactive.addTarget(self, action: #selector(deactive(sender:)), for: .touchUpInside)
        cell.btnDeactive.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(delete(sender:)), for: .touchUpInside)
        cell.btnDelete.tag = indexPath.row
        return cell
    }
    
    //MARK:- Action -
    
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
    @objc func active(sender: UIButton!) {
        
    }
    @objc func deactive(sender: UIButton!) {
        
    }
    @objc func playVideo(sender: UIButton!) {
        
    }
    @objc func delete(sender: UIButton!) {
        Utility.showAlertWithTwoBtns(messgae: LocalisationStrings.AlertMessage.removeVideo, controller: self) { (action) in
            if action == true {
                self.apiRemoveVideo()
            }
        }
    }
    @IBAction func btnaddVideo(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "AddVideoVC") as! AddVideoVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
//MARK:- TableView Delgate and Datasource -

extension AdvertiseVideoVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AdvertiseVideoCell.staticIdentifier) as! AdvertiseVideoCell
        return populateTableViewAdvertiseVideoCell(cell: cell, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = counter - 1
        if indexPath.row == lastItem {
            pagination()
        }
    }
}

extension AdvertiseVideoVC {
    
    //MARK:- API RATING & REVIEW LIST
    
    fileprivate func apiAdvertiseVideoList() {
        let userId = UserDefaults.standard.value(forKey:"user_id") as? Int ?? 0
        RequestManager.getAPIWithURLString(urlPart:"\("")\(userId)",successResult: { (response,statuscode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let dict = jsonData[kData].dictionary {
                    self.totalRecords = dict[ktotalRecords]?.int ?? 0
                    if let arrList = dict[kvideo]?.array {
                        if arrList.count != 0 {
                            if self.page == 0 {
                                self.arrAdvertiseVideoList = arrList.compactMap({(dict) -> AdvertiseVideoModel in AdvertiseVideoModel(dict: dict.dictionaryValue)})
                            } else {
                                for dict in arrList {
                                    self.arrAdvertiseVideoList.append(AdvertiseVideoModel(dict: dict.dictionaryValue))
                                }
                            }
                            self.tblView.reloadData()
                        }
                    }
                    self.refreshControl.endRefreshing()
                    
                }
            } else {
                if let messages = jsonData[kerror].string {
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
    
    public func apiRemoveVideo(){
        let params = [
            kUserId : dictList?.userId ?? 0,
            kvideoId: dictAdvertiseVideoList?.videoId ?? 0
            ] as [String : AnyObject]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
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
