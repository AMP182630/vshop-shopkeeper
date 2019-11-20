//
//  SalesExecutiveVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift

class SalesExecutiveVC: UIViewController {
    
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
        self.navigationItem.title = "Sales Executive"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
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
    
    //MARK:- Action -
    
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
}
