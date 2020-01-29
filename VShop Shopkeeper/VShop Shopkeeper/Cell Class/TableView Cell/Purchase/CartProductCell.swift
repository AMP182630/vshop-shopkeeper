//
//  CartProductCell.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 01/11/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class CartProductCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnaddProduct: UIButton!
    @IBOutlet weak var btnremoveProduct: UIButton!
    @IBOutlet weak var btnaddLeading: NSLayoutConstraint!
    @IBOutlet weak var lblquantityLeading: NSLayoutConstraint!
    
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
