//
//  NotificationViewController.swift
//  VShopDeliverBoy
//
//  Created by Neel Purohit on 27/11/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    //MARK:- Outlets -
    
    @IBOutlet var notificationTableView: UITableView!
    
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
    }
        
    //MARK:- Functions -
    
    fileprivate func registerXIB() {
        let NotificationTableViewCellTableViewCell = UINib(nibName: Constants.TableViewCell.NotificationTableViewCell, bundle: nil)
        self.notificationTableView.register(NotificationTableViewCellTableViewCell, forCellReuseIdentifier: Constants.TableViewCell.NotificationTableViewCell)
    }
    
    //MARK:- Populate Tableview Cell -
    
    fileprivate func populateTableViewNotificationCell(cell : NotificationTableViewCell, indexPath : IndexPath) -> NotificationTableViewCell {
        return cell
    }
    
    
    //MARK:- Actions -

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
}
