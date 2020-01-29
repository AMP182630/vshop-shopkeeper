//
//  CartVC.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 01/11/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class CartVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerXibs()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = "Cart"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerCartBackgroundVideoCallCell = UINib(nibName: "BackgroundVideoCallCell", bundle: nil)
        self.tblView.register(registerCartBackgroundVideoCallCell, forCellReuseIdentifier: "BackgroundVideoCallCell")
        let registerCartProductCell = UINib(nibName: "CartProductCell", bundle: nil)
        self.tblView.register(registerCartProductCell, forCellReuseIdentifier: "CartProductCell")
        let registerCartPricingCell = UINib(nibName: "PricingCell", bundle: nil)
        self.tblView.register(registerCartPricingCell, forCellReuseIdentifier: "PricingCell")
        let registerCartAddressCell = UINib(nibName: "CartAddressCell", bundle: nil)
        self.tblView.register(registerCartAddressCell, forCellReuseIdentifier: "CartAddressCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewvideoCall(cell : BackgroundVideoCallCell, indexPath : IndexPath) -> BackgroundVideoCallCell {
        return cell
    }
    fileprivate func populateTableViewcartProduct(cell : CartProductCell, indexPath : IndexPath) -> CartProductCell {
        return cell
    }
    fileprivate func populateTableViewPricingCell(cell : PricingCell, indexPath : IndexPath) -> PricingCell {
        return cell
    }
    fileprivate func populateTableViewCartAddressCell(cell : CartAddressCell, indexPath : IndexPath) -> CartAddressCell {
        cell.btnchangeAddress.addTarget(self, action: #selector(changeAddress(sender:)), for: .touchUpInside)
        return cell
    }
    
    //MARK:- Action -
    
    @objc func changeAddress(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- TableView Delgate and Datasource -

extension CartVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return 2
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BackgroundVideoCallCell") as! BackgroundVideoCallCell
            return populateTableViewvideoCall(cell: cell, indexPath: indexPath)
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartProductCell") as! CartProductCell
            return populateTableViewcartProduct(cell: cell, indexPath: indexPath)
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PricingCell") as! PricingCell
            return populateTableViewPricingCell(cell: cell, indexPath: indexPath)
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartAddressCell") as! CartAddressCell
            return populateTableViewCartAddressCell(cell: cell, indexPath: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
