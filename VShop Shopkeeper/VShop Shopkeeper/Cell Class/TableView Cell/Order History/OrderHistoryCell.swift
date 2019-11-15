//
//  OrderHistoryCell.swift
//  VShopUser
//
//  Created by Nimit Bagadiya on 25/10/19.
//  Copyright © 2019 Tushar Amkar. All rights reserved.
//

import UIKit

class OrderHistoryCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblorderId: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblorderProcess: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    //MARK:- Cell Lifecycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
