//
//  DisplayTimeTableViewCell.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 24/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class DisplayTimeTableViewCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    //MARK:- Cell Life Cycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
