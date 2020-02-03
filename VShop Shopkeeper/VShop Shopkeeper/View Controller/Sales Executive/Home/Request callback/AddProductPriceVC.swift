//
//  AddProductPriceVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SwiftyJSON

class AddProductPriceVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtQuantity: UITextField!
    
    //MARK:- Variables -
    
    var product = UIImage()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK:- Setup Function -
    
    func setUpView(){
        imgProduct.image = product
    }
    
    //MARK:- Action -
    
    @IBAction func btnaddProduct(_ sender: Any){
        
    }
    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension AddProductPriceVC {
    
    //MARK:- API REGISTER
    
    public func apiRegister(){
        let params = [
            kproductId: "",
            kproductPrice: txtPrice.text ?? "",
            kproductQuantity: txtQuantity.text ?? "",
            kcustomerId : "" ,
            kUserId : "" ,
            kDeviceType: 1
            ] as [String : AnyObject]
        RequestManager.postAPI(urlPart: "", parameters: params, successResult: { (response,statusCode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let data = jsonData[kData].dictionary {
                    print(data)
                    let nav = self.storyboard?.instantiateViewController(withIdentifier: "GetOTPVC") as! GetOTPVC
                    self.navigationController?.pushViewController(nav, animated: true)
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
