//
//  CallLogCell.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class CallLogCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lbldateTime: UILabel!
    @IBOutlet weak var imgcallImg: UIImageView!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblorderID: UILabel!
    
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
