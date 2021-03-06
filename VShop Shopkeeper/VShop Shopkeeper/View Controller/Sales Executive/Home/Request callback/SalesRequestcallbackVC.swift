//
//  SalesRequestcallbackVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift

class SalesRequestcallbackVC: UIViewController {
    
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
        self.navigationItem.title = "Request Call back"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = false
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerRequestCallbackCell = UINib(nibName: "RequestCallbackCell", bundle: nil)
        self.tblView.register(registerRequestCallbackCell, forCellReuseIdentifier: "RequestCallbackCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewRequestCallbackCell(cell : RequestCallbackCell, indexPath : IndexPath) -> RequestCallbackCell {
        cell.btnfaceTime.addTarget(self, action: #selector(faceTime(sender:)), for: .touchUpInside)
        return cell
    }
    
    //MARK:- Action -
    
    @IBAction func btnMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
    @objc func faceTime(sender: UIButton!) {
        if let nav = Storyboard.callLog.instantiate(viewController: OutgoingcallVC.self){
            nav.iscomefrom = true
            self.navigationController?.pushViewController(nav, animated: true)
        }
    }
}
//MARK:- TableView Delgate and Datasource -

extension SalesRequestcallbackVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCallbackCell") as! RequestCallbackCell
        return populateTableViewRequestCallbackCell(cell: cell, indexPath: indexPath)
    }
}
