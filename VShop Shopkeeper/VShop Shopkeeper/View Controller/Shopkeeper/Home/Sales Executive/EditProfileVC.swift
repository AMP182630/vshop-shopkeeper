//
//  EditProfileVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class EditProfileVC: UIViewController,UITextFieldDelegate,PassImgDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtfirstName: UITextField!
    @IBOutlet weak var txtlastName: UITextField!
    @IBOutlet weak var txtcontactNum: UITextField!
    @IBOutlet weak var txtpassWord: UITextField!
    
    //MARK:- Variables -
    
    var imgPickerObj = ImagePicker()
    var dictEditSaleExecutive : SalesExecutiveModel?
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setAPIData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = "Update Sales Executive"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        txtcontactNum.delegate = self
    }
    
    func setAPIData(){
        txtcontactNum.text = dictEditSaleExecutive?.salePhoneNumber
        txtfirstName.text = dictEditSaleExecutive?.salesName
        imgProfile.sd_setImage(with: URL(string: "\(Constant.baseURL.imageBaseUrl)\(dictEditSaleExecutive?.saleImage ?? "")"), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    private func validate() -> Bool {
        if txtfirstName.text?.count == 0{
            Utility.showAlert(message:LocalisationStrings.AlertMessage.PleaseEnterFirstName , controller: self) { (true) in}
            return false
        }else if txtlastName.text?.count == 0{
            Utility.showAlert(message:LocalisationStrings.AlertMessage.PleaseEnterLastName , controller: self) { (true) in}
            return false
        }else if txtcontactNum.text?.count == 0{
            Utility.showAlert(message:LocalisationStrings.AlertMessage.PleaseEnterContactNumber , controller: self) { (true) in}
            return false
        }
        else if txtcontactNum.text!.count < 10{
            Utility.showAlert(message:LocalisationStrings.AlertMessage.PleaseEnterValidMobileNumber , controller: self) { (true) in}
            return false
        }else if txtpassWord.text?.count == 0{
            Utility.showAlert(message: LocalisationStrings.AlertMessage.PleaseEnterValidPassword, controller: self) { (true) in}
            return false
        }
        return true
    }
    
    //MARK:- Action -
    
    @IBAction func btnaddProfile(_ sender: Any) {
        delegate = self
        imgPickerObj.currentViewController = self
        imgPickerObj.actionSheet()
    }
    @IBAction func btnEdit(_ sender: Any) {
        if validate(){
            //            apiEditSalesExecutive()
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    @IBAction func btnDelete(_ sender: Any) {
        //        apiDeleteSalesExecutive()
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- DELEGATE FOR SELECTED IMAGE -
    
    func selectedImage(image: UIImage) {
        imgProfile.image = image
    }
    
    //MARK:- Textfield Delegate -
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtcontactNum{
            return range.location < 10
        }
        return true
    }
}
extension EditProfileVC {
    
    //MARK:- API REGISTER
    
    fileprivate func apiEditSalesExecutive() {
        let params : [String : Any]  = [
            ksalesId : dictEditSaleExecutive?.salesId ?? 0,
            kUserId: dictList?.userId ?? 0,
            ksalesName: "\(txtfirstName.text ?? "") \(txtlastName.text ?? "")",
            ksalesNumber: txtcontactNum.text ?? "",
            klanguauge: "en",
        ]
        let imageParam = [
            ksalesImage:imgProfile.image
            ] as? [String : UIImage] ?? [:]
        Utility.showHud()
        RequestManager.postAPIWithSingleAttachmentMedia(view: self.view, urlPart:Constant.postURL.updateProfile, parameterImage:imageParam, fileUrl:nil, thumbnailImage:UIImage(), parameters: params, successResult: { (response,int)  in
            Utility.dismissGIF()
            let jsonData = JSON(response)
            print(jsonData)
            if jsonData[kSuccess] == true {
                if let message = jsonData["message"].string {
                    if message.count > 0{
                        Utility.showAlert(message: message, controller: self, alertComplition: { (true) in
                            if let dict = jsonData[kData].dictionary {
                                self.dictEditSaleExecutive = SalesExecutiveModel.init(dict: dict)
                            }
                        })
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
        }) { (error) in
            Utility.hideHud()
            Utility.showAlert(message: error.localizedDescription, controller: self, alertComplition: { (completion) in
            })
        }
    }
    
    public func apiDeleteSalesExecutive(){
        let params : [String : Any]  = [
            kUserId: dictList?.userId ?? 0,
            ksalesId : dictEditSaleExecutive?.salesId ?? 0,
            klanguauge: "en"
        ]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    self.navigationController?.popViewController(animated: true)
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
