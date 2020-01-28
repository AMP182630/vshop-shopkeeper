//
//  RequestCallBack.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 27/01/20.
//  Copyright © 2020 Shubham's Macbook Pro. All rights reserved.
//

import Foundation
import SwiftyJSON

class RequestCallBack: NSObject {
    var customerName, time : String!
    var customerId : Int!
    init(dict : [String : JSON]) {
        customerName = dict["customerName"]?.stringValue ?? ""
        time = dict["time"]?.stringValue ?? ""
        customerId = dict["customerId"]?.intValue ?? 0
    }
}
