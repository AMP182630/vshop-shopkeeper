//
//  RequestCallbackCell.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class RequestCallbackCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lbldateTime: UILabel!
    @IBOutlet weak var btnfaceTime: UIButton!
    
    //MARK:- Cell Lifeycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
