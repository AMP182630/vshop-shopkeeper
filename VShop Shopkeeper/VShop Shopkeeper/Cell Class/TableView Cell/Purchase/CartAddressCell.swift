//
//  CartAddressCell.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 01/11/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class CartAddressCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var btnchangeAddress: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
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
