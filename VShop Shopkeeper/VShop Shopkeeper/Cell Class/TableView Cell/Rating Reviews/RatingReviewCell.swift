//
//  RatingReviewCell.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import FloatRatingView

class RatingReviewCell: UITableViewCell {

    //MARK:- Outlets -
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewRating: FloatRatingView!
    @IBOutlet weak var lblReviews: UILabel!
    
    //MARK:- Cell Lifecycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
