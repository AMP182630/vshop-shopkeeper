//
//  OrderDetailVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 15/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class OrderDetailVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate{
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var pickerView  = UIView()
    let myPickerData = ["Pending","Receive","Reject","Dispatched","Delivered"]
    var orderStatus : OrderDetailCell = OrderDetailCell()
    var selectedIndex = 0
    public var dictOrderDetails : OrderHistoryListModel?
    
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
        /*   cell.lblName.text = dictOrderDetails?.customerName
         cell.lblorderId.text = dictOrderDetails?.customerOrderId
         cell.lblQuantity.text = dictOrderDetails?.quantity
         cell.lbldeliveryStatus.text = dictOrderDetails?.status
         cell.lblPrice.text = dictOrderDetails?.price */
        cell.btnselectPayment.addTarget(self, action: #selector(selectPayment(sender:)), for: .touchUpInside)
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
    
    @objc func selectPayment(sender: UIButton!) {
        
        let pickerView = UIView(frame: CGRect(x: 0, y: view.frame.height - 230, width: view.frame.width, height: 230))
        
        // Toolbar
        let btnDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(OrderDetailVC.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(OrderDetailVC.cancelClick))
        
        let barAccessory = UIToolbar(frame: CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 44))
        barAccessory.barStyle = .default
        barAccessory.isTranslucent = false
        barAccessory.items = [cancelButton, spaceButton, btnDone]
        pickerView.addSubview(barAccessory)
        
        // Month UIPIckerView
        let myPicker = UIPickerView(frame: CGRect(x: 0, y: barAccessory.frame.height, width: view.frame.width, height: pickerView.frame.height-barAccessory.frame.height))
        myPicker.delegate = self
        myPicker.dataSource = self
        myPicker.backgroundColor = UIColor.init(red: 245/255, green: 246/255, blue: 250/255, alpha: 1)
        pickerView.addSubview(myPicker)
        self.view.addSubview(pickerView)
        self.pickerView = pickerView
    }
    
    @objc func doneClick() {
        //        orderStatus.lbldeliveryStatus.text = myPickerData[selectedIndex]
        UIView.animate(withDuration: 0.5, animations: {
            self.pickerView.frame = CGRect(x: 0, y: self.view.bounds.size.height, width: self.pickerView.bounds.size.width, height: 0)
        }) { (status) in
            self.pickerView.subviews.forEach { (view) in
                view.removeFromSuperview()
            }
            self.pickerView.removeFromSuperview()
        }
        //        apiOrderStatus()
        selectedIndex = 0
    }
    
    @objc func cancelClick(){
        UIView.animate(withDuration: 0.5, animations: {
            self.pickerView.frame = CGRect(x: 0, y: self.view.bounds.size.height, width: self.pickerView.bounds.size.width, height: 0)
        }) { (status) in
            self.pickerView.subviews.forEach { (view) in
                view.removeFromSuperview()
            }
            self.pickerView.removeFromSuperview()
        }
    }
    
    //MARK:- Pickerview datasource & delegate -
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
}
//MARK:- TableView Delgate and Datasource -

extension OrderDetailVC : UITableViewDataSource,UITableViewDelegate{
    
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

extension OrderDetailVC {
    //MARK:- GET ORDER DETAILS
    
    fileprivate func apiGetOrderDetails() {
        RequestManager.getAPIWithURLString(urlPart:"",successResult: { (response,statuscode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let dict = jsonData[kData].dictionary {
                    self.dictOrderDetails = OrderHistoryListModel.init(dict: dict)
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
    
    public func apiOrderStatus(){
        let params : [String : Any]  = [
            kUserId: dictList?.userId ?? 0,
            kcustomerId : dictOrderDetails?.customerId ?? 0,
            kcustomerOrderId : dictOrderDetails?.customerOrderId ?? "",
            korderStatus : myPickerData[selectedIndex],
            klanguauge: "en"
        ]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    let section = 0
                    let row = 0
                    let indexPath = IndexPath(row: row, section: section)
                    if let cell = self.tblView.cellForRow(at: indexPath) as? OrderDetailCell {
                        cell.lbldeliveryStatus.text = self.myPickerData[self.selectedIndex]
                    }
                }
            } else {
                if let message = jsonData["message"].string {
                    if message.count > 0{
                        Utility.showAlert(message: message, controller: self, alertComplition: { (action) in
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
