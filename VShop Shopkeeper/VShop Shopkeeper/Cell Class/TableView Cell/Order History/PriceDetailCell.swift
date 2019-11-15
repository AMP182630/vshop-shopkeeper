//
//  PriceDetailCell.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 25/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class PriceDetailCell: UITableViewCell {

    //MARK:- Outlet -
    
    @IBOutlet weak var lblselectedItem: UILabel!
    @IBOutlet weak var lblPromotion: UILabel!
    @IBOutlet weak var lblproductPrice: UILabel!
    @IBOutlet weak var lbldeliveryCharge: UILabel!
    @IBOutlet weak var lblGST: UILabel!
    @IBOutlet weak var lblpromotionPrice: UILabel!
    @IBOutlet weak var lbltotalAmount: UILabel!
    
    //MARK:- Cell Lifecycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
