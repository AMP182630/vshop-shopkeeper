//
//  OrderDetailVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 15/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class OrderDetailVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UINavigationControllerDelegate{
    
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
        cell.btnselectPayment.addTarget(self, action: #selector(selectPayment(sender:)), for: .touchUpInside)
        return cell
    }
    fileprivate func populateTableViewPriceDetailCell(cell : PriceDetailCell, indexPath : IndexPath) -> PriceDetailCell {
        
        return cell
    }
    fileprivate func populateTableViewPaymentModeCell(cell : PaymentModeCell, indexPath : IndexPath) -> PaymentModeCell {
        
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
        let section = 0
        let row = 0
        let indexPath = IndexPath(row: row, section: section)
        if let cell = tblView.cellForRow(at: indexPath) as? OrderDetailCell {
            cell.lbldeliveryStatus.text = myPickerData[selectedIndex]
        }
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
