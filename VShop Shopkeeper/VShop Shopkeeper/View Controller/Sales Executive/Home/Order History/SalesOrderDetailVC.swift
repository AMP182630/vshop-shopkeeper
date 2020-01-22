//
//  SalesOrderDetailVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class SalesOrderDetailVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var pickerView  = UIView()
    let myPickerData = ["Pending","Receive","Reject","Dispatched","Delivered"]
    var orderStatus : OrderDetailCell = OrderDetailCell()
    var selectedIndex = 0
    
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
        self.navigationItem.title = "Order Detail"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerOrderDetailCell = UINib(nibName: "OrderDetailCell", bundle: nil)
        self.tblView.register(registerOrderDetailCell, forCellReuseIdentifier: "OrderDetailCell")
        let registerPriceDetailCell = UINib(nibName: "PriceDetailCell", bundle: nil)
        self.tblView.register(registerPriceDetailCell, forCellReuseIdentifier: "PriceDetailCell")
        let registerPaymentModeCell = UINib(nibName: "PaymentModeCell", bundle: nil)
        self.tblView.register(registerPaymentModeCell, forCellReuseIdentifier: "PaymentModeCell")
        //        self.payment = registerPaymentModeCell
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewOrderDetailCell(cell : OrderDetailCell, indexPath : IndexPath) -> OrderDetailCell {
        cell.bottomPrice.constant = 0
        cell.heightSelectPayment.constant = 0
        cell.btnselectPayment.isHidden = true
//        cell.imgProduct.isHidden = true
//        cell.widthimgProduct.constant = 0
//        cell.leadingName.constant = 0
        return cell
    }
    fileprivate func populateTableViewPriceDetailCell(cell : PriceDetailCell, indexPath : IndexPath) -> PriceDetailCell {
        
        return cell
    }
    fileprivate func populateTableViewPaymentModeCell(cell : PaymentModeCell, indexPath : IndexPath) -> PaymentModeCell {
        
        return cell
    }
    
    //MARK:- Action -
    
}
//MARK:- TableView Delgate and Datasource -

extension SalesOrderDetailVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailCell") as! OrderDetailCell
            return populateTableViewOrderDetailCell(cell: cell, indexPath: indexPath)
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentModeCell") as! PaymentModeCell
            return populateTableViewPaymentModeCell(cell: cell, indexPath: indexPath)
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriceDetailCell") as! PriceDetailCell
            return populateTableViewPriceDetailCell(cell: cell, indexPath: indexPath)
        }
    }
}

