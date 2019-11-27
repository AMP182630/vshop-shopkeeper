//
//  AddNewStoreViewController.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 22/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit
import SideMenuSwift

class AddNewStoreViewController: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet var addNewStoreTableView: UITableView!
    @IBOutlet var nextButton: UIButton!
    
    //MARK:- Public Variables -
    
    let addStoreFieldName = ["Store Name","Owner First Name","Owner Last Name","Mobile Number","Email Address","Store Address","Shop Name & Number","City","State","Hash Tag"]
    let days = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    var storeDetails : [String:String] = [
        "Store Name": "",
        "Owner First Name": "",
        "Owner Last Name": "",
        "Mobile Number": "",
        "Email Address": "",
        "Store Address": "",
        "Shop Name & Number": "",
        "City": "",
        "State": "",
        "Hash Tag": ""
    ]
    
    //MARK:- Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
        self.viewConfiguration()
    }
    
    //MAKR:- Register XIB -
    
    func registerXIB() {
        let addNewStoreDetailNib = UINib.init(nibName: "AddStoreDetailsTableViewCell", bundle: nil)
        self.addNewStoreTableView.register(addNewStoreDetailNib, forCellReuseIdentifier: "AddStoreDetailsTableViewCell")
        
        let nextButtonNib = UINib.init(nibName: "NextButtonTableViewCell", bundle: nil)
        self.addNewStoreTableView.register(nextButtonNib, forCellReuseIdentifier: "NextButtonTableViewCell")
    }
    
    //MARK:- Setup Methods -
    
    fileprivate func viewConfiguration() {
        addNewStoreTableView.delegate = self
        addNewStoreTableView.dataSource = self
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = "Add New Store"

        let addNewStoreDetailNib = UINib.init(nibName: "AddStoreDetailsTableViewCell", bundle: nil)
        self.addNewStoreTableView.register(addNewStoreDetailNib, forCellReuseIdentifier: "AddStoreDetailsTableViewCell")
        
        let selectOptionsNib = UINib.init(nibName: "SelectOptionsTableViewCell", bundle: nil)
        self.addNewStoreTableView.register(selectOptionsNib, forCellReuseIdentifier: "SelectOptionsTableViewCell")
        
        let timeLabelNib = UINib.init(nibName: "TimingLabelTableViewCell", bundle: nil)
        self.addNewStoreTableView.register(timeLabelNib, forCellReuseIdentifier: "TimingLabelTableViewCell")
        
        let displayTimingNib = UINib.init(nibName: "DisplayTimeTableViewCell", bundle: nil)
        self.addNewStoreTableView.register(displayTimingNib, forCellReuseIdentifier: "DisplayTimeTableViewCell")
    }
    
    //MARK:- Actions -
    
    @IBAction func MenuButton(_ sender: UIBarButtonItem) {
        self.sideMenuController?.revealMenu()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        let alertMessage : String = checkValidation()
        
//        if alertMessage != "" {
//            Utility.showAlert(message: alertMessage, controller: self) { (true) in}
//        } else {
            let panCardVC = self.storyboard?.instantiateViewController(withIdentifier: "PanCardDetailsViewController") as! PanCardDetailsViewController
            self.navigationController?.pushViewController(panCardVC, animated: true)
//        }
    }
    
    @IBAction func btnNotification(_ sender: UIBarButtonItem) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
    
    
    //MARK:- Functions -
    
    func checkValidation() -> String {
        var message = ""
        
        message = storeNameTextField()
        
        if message == "" {
            message = ownerFirstName()
            if message == "" {
                message = ownerLastName()
                if message == "" {
                    message = mobileNumber()
                    if message == "" {
                        message = emailAddress()
                        if message == "" {
                            message = storeAddress()
                            if message == "" {
                                message = shopNameAndNumber()
                                if message == "" {
                                    message = city()
                                    if message == "" {
                                        message = state()
                                        if message == "" {
                                            message = hashTag()
                                            if message == "" {
                                                return ""
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return message
    }
    
    func storeNameTextField() -> String {
        if storeDetails[addStoreFieldName[0]] == "" {
            return "Please Enter Store Name"
        } else {
            return ""
        }
    }
    
    func ownerFirstName() -> String {
        if storeDetails[addStoreFieldName[1]] == "" {
            return "Please Enter Owner First Name"
        } else {
            return ""
        }
    }
    
    func ownerLastName() -> String {
        if storeDetails[addStoreFieldName[2]] == "" {
            return "Please Enter Owner Last Name"
        } else {
            return ""
        }
    }
    
    func mobileNumber() -> String {
        if storeDetails[addStoreFieldName[3]] == "" {
            return "Please Enter Mobile Number"
        } else {
            return ""
        }
    }
    
    func emailAddress() -> String {
        if storeDetails[addStoreFieldName[4]] == "" {
            return "Please Enter Email Address"
        } else {
            return ""
        }
    }
    
    func storeAddress() -> String {
        if storeDetails[addStoreFieldName[5]] == "" {
            return "Please Enter Store Address"
        } else {
            return ""
        }
    }
    
    func shopNameAndNumber() -> String {
        if storeDetails[addStoreFieldName[6]] == "" {
            return "Please Enter Shop Name & Number"
        } else {
            return ""
        }
    }
    
    func city() -> String {
        if storeDetails[addStoreFieldName[7]] == "" {
            return "Please Enter City"
        } else {
            return ""
        }
    }
    
    func state() -> String {
        if storeDetails[addStoreFieldName[8]] == "" {
            return "Please Enter State"
        } else {
            return ""
        }
    }
    
    func hashTag() -> String {
        if storeDetails[addStoreFieldName[9]] == "" {
            return "Please Enter Hash Tag"
        } else {
            return ""
        }
    }
    
    fileprivate func populateAddStoreCell(cell: AddStoreDetailsTableViewCell, indexPath: IndexPath) -> AddStoreDetailsTableViewCell {
        cell.detailTextField.delegate = self
        cell.detailLabel.text = addStoreFieldName[indexPath.row]
        cell.detailTextField.accessibilityIdentifier = addStoreFieldName[indexPath.row]
        
        if indexPath.row == 5  {
            cell.storeAddressImage?.isHidden = false
            cell.storeAddressImageWidthConstant.constant = 22
            cell.detailsTextFieldTrailingConstant.constant = 8
        }
        return cell
    }
    
    fileprivate func populateSelectionOptionCell(cell: SelectOptionsTableViewCell, indexPath: IndexPath) -> SelectOptionsTableViewCell {
        cell.selectStoreTimingButton.addTarget(self, action: #selector(selectStoreTimingButtonTapped(sender:)), for: .touchUpInside)
         cell.selectCategoryButton.addTarget(self, action: #selector(selectCategoryButtonTapped(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func selectStoreTimingButtonTapped(sender: UIButton) {
        print("selectStoreTimingButtonTapped")
    }
    
    @objc func selectCategoryButtonTapped(sender: UIButton) {
        let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectCategoryViewController") as! SelectCategoryViewController
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    fileprivate func populateDisplayTimingCell(cell: DisplayTimeTableViewCell, indexPath: IndexPath) -> DisplayTimeTableViewCell {
        cell.dayLabel.text = days[indexPath.row]
        return cell
    }
}

//MARK:- TableView Delegate & DataSource -

extension AddNewStoreViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return addStoreFieldName.count
        } else if section == 1 {
            return 1
        } else {
            return days.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let addStoreDetailsCell = addNewStoreTableView.dequeueReusableCell(withIdentifier: "AddStoreDetailsTableViewCell", for: indexPath) as! AddStoreDetailsTableViewCell
            return populateAddStoreCell(cell: addStoreDetailsCell, indexPath: indexPath)
        } else if indexPath.section == 1 {
            let selectionOptionCell = addNewStoreTableView.dequeueReusableCell(withIdentifier: "SelectOptionsTableViewCell", for: indexPath) as! SelectOptionsTableViewCell
            return populateSelectionOptionCell(cell: selectionOptionCell, indexPath: indexPath)
        } else {
            let displayTimingCell = addNewStoreTableView.dequeueReusableCell(withIdentifier: "DisplayTimeTableViewCell", for: indexPath) as! DisplayTimeTableViewCell
            return populateDisplayTimingCell(cell: displayTimingCell, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 71
        } else if indexPath.section == 1 {
            return 153
        } else {
            return 71
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 35
        }else{
            return 0.1
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: addNewStoreTableView.bounds.size.width, height: 35))
            let label = UILabel()
            label.frame = CGRect.init(x: 16, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "Store Timing"
            label.font = UIFont(name:"Roboto-Regular", size: 16.0)
            headerView.isHidden = false
            headerView.addSubview(label)
            return headerView
        }
        return UIView()
    }
}

//MARK:- TextField Delegate -

extension AddNewStoreViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.accessibilityIdentifier == addStoreFieldName[0] {
            storeDetails[addStoreFieldName[0]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[1] {
            storeDetails[addStoreFieldName[1]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[2] {
            storeDetails[addStoreFieldName[2]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[3] {
            storeDetails[addStoreFieldName[3]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[4] {
            storeDetails[addStoreFieldName[4]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[5] {
            storeDetails[addStoreFieldName[5]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[6] {
            storeDetails[addStoreFieldName[6]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[7] {
            storeDetails[addStoreFieldName[7]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[8] {
            storeDetails[addStoreFieldName[8]] = textField.text
        } else if textField.accessibilityIdentifier == addStoreFieldName[9] {
            storeDetails[addStoreFieldName[9]] = textField.text
        }
        return true
    }
}
