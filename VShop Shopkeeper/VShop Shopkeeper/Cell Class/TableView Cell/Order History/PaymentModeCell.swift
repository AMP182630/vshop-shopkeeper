//
//  PaymentModeCell.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 15/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class PaymentModeCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var lblpaymentMethod: UILabel!
    @IBOutlet weak var lblcardNum: UILabel!
    @IBOutlet weak var lbltransactionID: UILabel!    
    
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
