//
//  SelectOptionsTableViewCell.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 24/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class SelectOptionsTableViewCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet var selectStoreTimingButton: UIButton!
    @IBOutlet var selectCategoryButton: UIButton!
    
    //MARK:- Cell Life Cycle -

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
