//
//  SalesRatingModel.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 30/01/20.
//  Copyright © 2020 Shubham's Macbook Pro. All rights reserved.
//

import Foundation
import SwiftyJSON

class SalesRatingModel: NSObject {
    var customerName, customerImage, comment, rating : String!
    var customerId : Int!
    init(dict : [String : JSON]) {
        customerName = dict["customerName"]?.stringValue ?? ""
        customerImage = dict["customerImage"]?.stringValue ?? ""
        customerId = dict["customerId"]?.intValue ?? 0
        comment = dict["comment"]?.stringValue ?? ""
        rating = dict["rating"]?.stringValue ?? ""
    }
}
