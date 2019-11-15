//
//  PermissionCell.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class PermissionCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var btnselectPermission: UIButton!
    @IBOutlet weak var lblPermission: UILabel!
    
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
