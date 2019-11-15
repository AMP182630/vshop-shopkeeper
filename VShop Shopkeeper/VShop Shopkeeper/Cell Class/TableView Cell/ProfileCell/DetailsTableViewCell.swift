//
//  DetailsTableViewCell.swift
//  VShopRomingStaff
//
//  Created by Shubham's Macbook Pro on 12/11/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
