//
//  SalesExecutiveCell.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class SalesExecutiveCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var imgsalesExecutive: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var lblmobileNum: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnPermission: UIButton!
    
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
