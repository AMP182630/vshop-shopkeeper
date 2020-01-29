//
//  PricingCell.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 01/11/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class PricingCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var lbltotalAmount: UILabel!
    @IBOutlet weak var lbldeliveryCharge: UILabel!
    @IBOutlet weak var lblpayableAmount: UILabel!
    
    //AMRK:- Cell Lifecycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
