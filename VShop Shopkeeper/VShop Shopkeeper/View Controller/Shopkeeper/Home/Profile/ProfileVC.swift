//
//  ProfileVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 15/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift
import SwiftyJSON

class ProfileVC: UIViewController,PassImgDelegate{
    
    //MARK:- Outlets -
    
    @IBOutlet var tblView: UITableView!
    
    //MARK:- Public Variables -
    
    let storeFieldName = ["Store Name","Owner First Name","Owner Last Name","Mobile Number","Email Address","Store Address","Shop Name & Number","City","State"]
    let days = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
    let categoryList = ["Electronics", "TVs", "Fashion", "Home", "Clothes"]
    let details = ["PAN Card Details","GST Certi Details","Aadhar Card Details","Store Registeration Certi. Details","Other Documents","Store Images"]
    var imgPickerObj = ImagePicker()
    
    //MARK:- Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerXIB()
        setUpView()
    }
    
    //MARK:- Setup Function -
    
    func setUpView(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.title = "Profile"
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
    }
    
    //MARK:- Register XIB -
    
    func registerXIB() {
        let profileImageNib = UINib.init(nibName: "ProfileImageTableViewCell", bundle: nil)
        self.tblView.register(profileImageNib, forCellReuseIdentifier: "ProfileImageTableViewCell")
        let addNewStoreDetailNib = UINib.init(nibName: "AddStoreDetailsTableViewCell", bundle: nil)
        self.tblView.register(addNewStoreDetailNib, forCellReuseIdentifier: "AddStoreDetailsTableViewCell")
        let HashTagTableViewNib = UINib.init(nibName: "HashTagTableViewCell", bundle: nil)
        self.tblView.register(HashTagTableViewNib, forCellReuseIdentifier: "HashTagTableViewCell")
        let CategoryTableViewNib = UINib.init(nibName: "CategoryTableViewCell", bundle: nil)
        self.tblView.register(CategoryTableViewNib, forCellReuseIdentifier: "CategoryTableViewCell")
        let DisplayTimeTableViewNib = UINib.init(nibName: "DisplayTimeTableViewCell", bundle: nil)
        self.tblView.register(DisplayTimeTableViewNib, forCellReuseIdentifier: "DisplayTimeTableViewCell")
        let DetailsTableViewNib = UINib.init(nibName: "DetailsTableViewCell", bundle: nil)
        self.tblView.register(DetailsTableViewNib, forCellReuseIdentifier: "DetailsTableViewCell")
    }
    
    //MARK:- Populate Tableview cell -
    
    fileprivate func populateProfileImageCell(cell: ProfileImageTableViewCell, indexPath: IndexPath) -> ProfileImageTableViewCell {
        cell.btnProfile.addTarget(self, action: #selector(addProfileImg(sender:)), for: .touchUpInside)
        return cell
    }
    fileprivate func  populateStoreListCell(cell: AddStoreDetailsTableViewCell, indexPath: IndexPath) -> AddStoreDetailsTableViewCell {
        cell.detailLabel.text = storeFieldName[indexPath.row]
        /* cell.detailTextField.text = dictList?.storeName */
        return cell
    }
    fileprivate func  populateHashTagCell(cell: HashTagTableViewCell, indexPath: IndexPath) -> HashTagTableViewCell {
        return cell
    }
    fileprivate func  populateCategoryCell(cell: CategoryTableViewCell, indexPath: IndexPath) -> CategoryTableViewCell {
        cell.categoryListLabel.text = categoryList[indexPath.row]
        cell.categoryListLabel.font = UIFont(name: "Roboto-Regular", size: 16)
        cell.categoryListLabel.textColor = UIColor.init(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
        return cell
    }
    fileprivate func  populateDisplayTimeCell(cell: DisplayTimeTableViewCell, indexPath: IndexPath) -> DisplayTimeTableViewCell {
        cell.dayLabel.text = days[indexPath.row]
        return cell
    }
    fileprivate func  populateDetailsCell(cell: DetailsTableViewCell, indexPath: IndexPath) -> DetailsTableViewCell {
        cell.detailsLabel.text = details[indexPath.row]
        return cell
    }
    
    //MARK:- Action -
    
    @IBAction func btnsideMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
    @objc func addProfileImg(sender: UIButton!) {
        delegate = self
        imgPickerObj.currentViewController = self
        imgPickerObj.actionSheet()
    }
    
    //MARK:- DELEGATE FOR SELECTED IMAGE -
    
    func selectedImage(image: UIImage) {
        let section = 0
        let row = 0
        let indexPath = IndexPath(row: row, section: section)
        if let cell = tblView.cellForRow(at: indexPath) as? ProfileImageTableViewCell {
            cell.profileImageView.image = image
        }
    }
}

//MARK:- TableView Delegate & DataSource -

extension ProfileVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return storeFieldName.count
        }else if section == 2{
            return 1
        }else if section == 3{
            return categoryList.count
        }else if section == 4{
            return days.count
        }else{
            return details.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let profileImage = tblView.dequeueReusableCell(withIdentifier: "ProfileImageTableViewCell", for: indexPath) as! ProfileImageTableViewCell
            return populateProfileImageCell(cell: profileImage, indexPath: indexPath)
        }else if indexPath.section == 1{
            let cell = tblView.dequeueReusableCell(withIdentifier: "AddStoreDetailsTableViewCell", for: indexPath) as! AddStoreDetailsTableViewCell
            return populateStoreListCell(cell: cell, indexPath: indexPath)
        }
        else if indexPath.section == 2{
            let cell = tblView.dequeueReusableCell(withIdentifier: "HashTagTableViewCell", for: indexPath) as! HashTagTableViewCell
            return populateHashTagCell(cell: cell, indexPath: indexPath)
        }else if indexPath.section == 3{
            let cell = tblView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
            return populateCategoryCell(cell: cell, indexPath: indexPath)
        }else if indexPath.section == 4{
            let cell = tblView.dequeueReusableCell(withIdentifier: "DisplayTimeTableViewCell", for: indexPath) as! DisplayTimeTableViewCell
            return populateDisplayTimeCell(cell: cell, indexPath: indexPath)
        }else{
            let cell = tblView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
            return populateDetailsCell(cell: cell, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tblView.bounds.size.width, height: 35))
        let label = UILabel()
        label.frame = CGRect.init(x: 16, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        if section == 2{
            label.text = "Hash Tag"
        }else if section == 3{
            label.text = "Store Categories"
        }
        else if section == 4{
            label.text = "Store Timing"
        }
        label.font = UIFont(name:"Roboto-Regular", size: 16.0)
        headerView.isHidden = false
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0.1
        }else if section == 1{
            return 0.1
        }else if section == 5{
            return 20
        }else{
            return 35
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 5{
            if indexPath.row == 0{
                if let nav = Storyboard.addNewStore.instantiate(viewController: PanCardDetailsViewController.self){
                    self.navigationController?.pushViewController(nav, animated: true)
                }
            }else if indexPath.row == 1{
                if let nav = Storyboard.addNewStore.instantiate(viewController: GSTCretificatesDetailsViewController.self){
                    self.navigationController?.pushViewController(nav, animated: true)
                }
            }else if indexPath.row == 2{
                if let nav = Storyboard.addNewStore.instantiate(viewController: AadharCardDetailsViewController.self){
                    self.navigationController?.pushViewController(nav, animated: true)
                }
            }else if indexPath.row == 3{
                if let nav = Storyboard.addNewStore.instantiate(viewController: StoreRegistrationViewController.self){
                    self.navigationController?.pushViewController(nav, animated: true)
                }
            }else if indexPath.row == 4{
                if let nav = Storyboard.addNewStore.instantiate(viewController: OtherDocumentDetailsViewController.self){
                    self.navigationController?.pushViewController(nav, animated: true)
                }
            }else{
                if let nav = Storyboard.addNewStore.instantiate(viewController: StoreImageViewController.self){
                    self.navigationController?.pushViewController(nav, animated: true)
                }
            }
        }
    }
}

extension ProfileVC {
    //MARK:- GET PROFILE DATA
       
       fileprivate func apiGetProfile() {
           let userId = UserDefaults.standard.value(forKey:"user_id") as? Int ?? 0
           RequestManager.getAPIWithURLString(urlPart:"\("")\(userId)",successResult: { (response,statuscode) in
               let jsonData = JSON(response)
               if jsonData[kSuccess] == true {
                   if let dict = jsonData[kData].dictionary {
                       dictList = UserModel.init(dict: dict)
                      
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
