//
//  HashTagTableViewCell.swift
//  VShopRomingStaff
//
//  Created by Shubham's Macbook Pro on 12/11/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class HashTagTableViewCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var lblHashtags: UILabel!
    
    //MARK:- cell lifecycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
