//
//  NotificationModel.swift
//  VShop Shopkeeper
//
//  Created by MAC on 20/01/20.
//  Copyright © 2020 Shubham's Macbook Pro. All rights reserved.
//

import Foundation
import SwiftyJSON

class NotificationModel: NSObject {
    var dateTime, date, time, message : String!
    var notificationId : Int!
    init(dict : [String : JSON]) {
        dateTime = dict["dateTime"]?.stringValue ?? ""
        date = dict["date"]?.stringValue ?? ""
        time = dict["time"]?.stringValue ?? ""
        message = dict["message"]?.stringValue ?? ""
        notificationId = dict["notificationId"]?.intValue ?? 0
    }
}
