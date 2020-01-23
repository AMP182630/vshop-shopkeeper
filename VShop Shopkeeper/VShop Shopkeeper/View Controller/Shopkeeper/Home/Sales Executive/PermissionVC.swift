//
//  PermissionVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class PermissionVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var permission = ["Order History ","Call Log","Request Call Back","Check Rating Review","Advertise Video"]
    var selectedRows:[IndexPath] = []
    
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
        self.navigationItem.title = "Permission"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registersalesPermissionCell = UINib(nibName: "PermissionCell", bundle: nil)
        self.tblView.register(registersalesPermissionCell, forCellReuseIdentifier: "PermissionCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewPermissionCell(cell : PermissionCell, indexPath : IndexPath) -> PermissionCell {
        cell.lblPermission.text = permission[indexPath.row]
        if selectedRows.contains(indexPath)
        {
            cell.btnselectPermission.setImage(UIImage(named: "checkBox"), for: .normal)
        }
        else{
            cell.btnselectPermission.setImage(UIImage(named: "default"), for: .normal)
        }
        cell.btnselectPermission.tag = indexPath.row
        cell.btnselectPermission.addTarget(self, action: #selector(selectPermission(sender:)), for: .touchUpInside)
        return cell
    }
    
    //MARK:- Action -
    
    @objc func selectPermission(sender: UIButton!) {
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
        if self.selectedRows.contains(selectedIndexPath)
        {
            self.selectedRows.remove(at: self.selectedRows.firstIndex(of: selectedIndexPath)!)
        }
        else
        {
            self.selectedRows.append(selectedIndexPath)
        }
        self.tblView.reloadData()
    }
    @IBAction func btnSubmit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- TableView Delgate and Datasource -

extension PermissionVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permission.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PermissionCell") as! PermissionCell
        return populateTableViewPermissionCell(cell: cell, indexPath: indexPath)
    }
}
