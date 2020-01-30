//
//  SalesOrderDetailVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class SalesOrderDetailVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var pickerView  = UIView()
    let myPickerData = ["Pending","Receive","Reject","Dispatched","Delivered"]
    var orderStatus : OrderDetailCell = OrderDetailCell()
    var selectedIndex = 0
    public var dictOrderDetails : SalesOrderListModel?
    
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
        self.navigationItem.title = LocalisationStrings.NavigationTitle.orderDetail
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerOrderDetailCell = UINib(nibName: OrderDetailCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerOrderDetailCell, forCellReuseIdentifier: OrderDetailCell.staticIdentifier)
        let registerPriceDetailCell = UINib(nibName: PriceDetailCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerPriceDetailCell, forCellReuseIdentifier: PriceDetailCell.staticIdentifier)
        let registerPaymentModeCell = UINib(nibName: PaymentModeCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerPaymentModeCell, forCellReuseIdentifier: PaymentModeCell.staticIdentifier)
        //        self.payment = registerPaymentModeCell
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewOrderDetailCell(cell : OrderDetailCell, indexPath : IndexPath) -> OrderDetailCell {
        cell.bottomPrice.constant = 0
        cell.heightSelectPayment.constant = 0
        cell.btnselectPayment.isHidden = true
        /*   cell.lblName.text = dictOrderDetails?.customerName
        cell.lblorderId.text = dictOrderDetails?.customerOrderId
        cell.lblQuantity.text = dictOrderDetails?.quantity
        cell.lbldeliveryStatus.text = dictOrderDetails?.status
        cell.lblPrice.text = dictOrderDetails?.price */
        //        cell.imgProduct.isHidden = true
        //        cell.widthimgProduct.constant = 0
        //        cell.leadingName.constant = 0
        return cell
    }
    fileprivate func populateTableViewPriceDetailCell(cell : PriceDetailCell, indexPath : IndexPath) -> PriceDetailCell {
        /*   cell.lblproductPrice.text = dictOrderDetails?.price
        cell.lbldeliveryCharge.text = dictOrderDetails?.deliveryCharge
        cell.lblGST.text = dictOrderDetails?.GST
        cell.lblpromotionPrice.text = dictOrderDetails?.AppliedPromotionPrice
        cell.lbltotalAmount.text = dictOrderDetails?.TotalAmount */
        return cell
    }
    fileprivate func populateTableViewPaymentModeCell(cell : PaymentModeCell, indexPath : IndexPath) -> PaymentModeCell {
        /*        cell.lblcardNum.text = dictOrderDetails?.creditCard
        cell.lbltransactionID.text = dictOrderDetails?.transactionId */
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
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderDetailCell.staticIdentifier) as! OrderDetailCell
            return populateTableViewOrderDetailCell(cell: cell, indexPath: indexPath)
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: PaymentModeCell.staticIdentifier) as! PaymentModeCell
            return populateTableViewPaymentModeCell(cell: cell, indexPath: indexPath)
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: PriceDetailCell.staticIdentifier) as! PriceDetailCell
            return populateTableViewPriceDetailCell(cell: cell, indexPath: indexPath)
        }
    }
}
extension SalesOrderDetailVC {
    
    //MARK:- GET ORDER DETAILS
    
    fileprivate func apiGetOrderDetails() {
        RequestManager.getAPIWithURLString(urlPart:"",successResult: { (response,statuscode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let dict = jsonData[kData].dictionary {
                    self.dictOrderDetails = SalesOrderListModel.init(dict: dict)
                    self.tblView.reloadData()
                }
            } else {
                if let messages = jsonData["error"].string {
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
}
