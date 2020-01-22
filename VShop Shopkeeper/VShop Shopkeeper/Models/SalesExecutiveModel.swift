//
//  SalesExecutiveModel.swift
//  VShop Shopkeeper
//
//  Created by MAC on 20/01/20.
//  Copyright © 2020 Shubham's Macbook Pro. All rights reserved.
//

import Foundation
import SwiftyJSON

class SalesExecutiveModel: NSObject {
    var salesName, saleImage, salePhoneNumber : String!
    var salesId : Int!
    init(dict : [String : JSON]) {
        salesName = dict["salesName"]?.stringValue ?? ""
        saleImage = dict["saleImage"]?.stringValue ?? ""
        salePhoneNumber = dict["salePhoneNumber"]?.stringValue ?? ""
        salesId = dict["salesId"]?.intValue ?? 0
    }
}
