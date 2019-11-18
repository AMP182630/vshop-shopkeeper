//
//  AdvertiseVideoCell.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class AdvertiseVideoCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var btnplayVideo: UIButton!
    @IBOutlet weak var btnActive: UIButton!
    @IBOutlet weak var btnDeactive: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
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
