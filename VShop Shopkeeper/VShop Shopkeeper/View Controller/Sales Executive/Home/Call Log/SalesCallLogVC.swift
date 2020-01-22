//
//  SalesCallLogVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift

class SalesCallLogVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var name = ["Shubham","Neel","Parth","Akash","Tushar","Nimit","Nidhi"]
    
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
        self.navigationItem.title = "Call Log"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = false
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerCallLogCell = UINib(nibName: "CallLogCell", bundle: nil)
        self.tblView.register(registerCallLogCell, forCellReuseIdentifier: "CallLogCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewCallLogCell(cell : CallLogCell, indexPath : IndexPath) -> CallLogCell {
        cell.lblName.text = name[indexPath.row]
        return cell
    }
    
    //MARK:- Action -
    
    @IBAction func btnsideMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
    }
}

//MARK:- TableView Delgate and Datasource -

extension SalesCallLogVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CallLogCell") as! CallLogCell
        return populateTableViewCallLogCell(cell: cell, indexPath: indexPath)
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nav = self.storyboard?.instantiateViewController(withIdentifier: "OutgoingcallVC") as! OutgoingcallVC
//        self.navigationController?.pushViewController(nav, animated: true)    }
}
