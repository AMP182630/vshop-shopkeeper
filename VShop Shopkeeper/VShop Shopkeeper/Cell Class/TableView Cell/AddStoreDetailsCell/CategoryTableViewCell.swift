//
//  CategoryTableViewCell.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 25/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    //MARK:- Outlets -

    @IBOutlet var categoryListLabel: UILabel!
    @IBOutlet var categorySelectionImage: UIImageView!
    
    @IBOutlet var imageWidthConstant: NSLayoutConstraint!
    //MARK:- Cell Life Cycle -

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
