//
//  AddressVC.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 24/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class AddressVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    fileprivate var selectedIndex = -1
    var address = [String]()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXibs()
        setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = "Address"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerCartBackgroundVideoCallCell = UINib(nibName: "BackgroundVideoCallCell", bundle: nil)
        self.tblView.register(registerCartBackgroundVideoCallCell, forCellReuseIdentifier: "BackgroundVideoCallCell")
        let registerShoppingCell = UINib(nibName: "AddressCell", bundle: nil)
        self.tblView.register(registerShoppingCell, forCellReuseIdentifier: "AddressCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewaddress(cell : AddressCell, indexPath : IndexPath) -> AddressCell {
        cell.btnselectAddress.addTarget(self, action: #selector(selectAddress(sender:)), for: .touchUpInside)
        cell.btnselectAddress.tag = indexPath.row
        if (selectedIndex == indexPath.row) {
            cell.btnselectAddress.isSelected = true
            cell.btnselectAddress.tag = indexPath.row
        } else {
            cell.btnselectAddress.isSelected = false
        }
        return cell
    }
    fileprivate func populateTableViewvideoCall(cell : BackgroundVideoCallCell, indexPath : IndexPath) -> BackgroundVideoCallCell {
        return cell
    }
    
    //MARK:- Action -
    
    @objc func selectAddress(sender: UIButton!) {
        selectedIndex = sender.tag
        tblView.reloadData()
        print("Button tapped")
    }
    @IBAction func btnaddNewAddress(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
}

//MARK:- TableView Delgate and Datasource -

extension AddressVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BackgroundVideoCallCell") as! BackgroundVideoCallCell
            return populateTableViewvideoCall(cell: cell, indexPath: indexPath)
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell") as! AddressCell
            return populateTableViewaddress(cell: cell, indexPath: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

