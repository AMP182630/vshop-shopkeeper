//
//  OrderDetailCell.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 25/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class OrderDetailCell: UITableViewCell {

    //MARK:- Outlet -

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblorderId: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lbldeliveryStatus: UILabel!
    @IBOutlet weak var btnselectPayment: UIButton!
    @IBOutlet weak var heightSelectPayment: NSLayoutConstraint!
    @IBOutlet weak var widthimgProduct: NSLayoutConstraint!
    @IBOutlet weak var bottomPrice: NSLayoutConstraint!
    @IBOutlet weak var leadingName: NSLayoutConstraint!
    
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
