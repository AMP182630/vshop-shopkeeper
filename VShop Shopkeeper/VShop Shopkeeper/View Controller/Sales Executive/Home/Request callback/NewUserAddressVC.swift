//
//  NewUserAddressVC.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 01/11/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class NewUserAddressVC: UIViewController {
    
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
        self.navigationItem.title = LocalisationStrings.NavigationTitle.customerCart
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerCartBackgroundVideoCallCell = UINib(nibName: BackgroundVideoCallCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerCartBackgroundVideoCallCell, forCellReuseIdentifier: BackgroundVideoCallCell.staticIdentifier)
        let registerCartProductCell = UINib(nibName: CartProductCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerCartProductCell, forCellReuseIdentifier: CartProductCell.staticIdentifier)
        let registerCartPricingCell = UINib(nibName: PricingCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerCartPricingCell, forCellReuseIdentifier: PricingCell.staticIdentifier)
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
    
    //MARK:- Action -
    
    @IBAction func btnAddress(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "AddressVC") as! AddressVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
}

//MARK:- TableView Delgate and Datasource -

extension NewUserAddressVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
            let cell = tableView.dequeueReusableCell(withIdentifier: BackgroundVideoCallCell.staticIdentifier) as! BackgroundVideoCallCell
            return populateTableViewvideoCall(cell: cell, indexPath: indexPath)
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: CartProductCell.staticIdentifier) as! CartProductCell
            return populateTableViewcartProduct(cell: cell, indexPath: indexPath)
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: PricingCell.staticIdentifier) as! PricingCell
            return populateTableViewPricingCell(cell: cell, indexPath: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
