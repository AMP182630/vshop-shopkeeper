//
//  ProfileImageTableViewCell.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 23/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet weak var btnProfile: UIButton!
    
    //MARK:- Cell Life Cycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
