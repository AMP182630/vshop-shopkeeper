//
//  AddProductPriceVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

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
