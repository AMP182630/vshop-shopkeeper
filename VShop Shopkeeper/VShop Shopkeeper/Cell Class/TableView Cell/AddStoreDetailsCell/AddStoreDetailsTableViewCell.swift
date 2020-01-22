//
//  AddStoreDetailsTableViewCell.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 22/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit
import SideMenuSwift

class AddStoreDetailsTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var detailTextField: UITextField!
    @IBOutlet var storeAddressImage: UIImageView!
    @IBOutlet var storeAddressImageWidthConstant: NSLayoutConstraint!
    @IBOutlet var detailsTextFieldTrailingConstant: NSLayoutConstraint!
    
    //MARK:- Public Variables -
    
//    let addStoreFieldName = ["Store Name","Owner First Name","Owner Last Name","Mobile Number","Email Address","Store Address","Shop Name & Number","City","State","Hash Tag"]
    
    //MARK:- Life Cycle Methods -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailTextField.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
