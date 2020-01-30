//
//  AdvertiseVideoModel.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 24/01/20.
//  Copyright © 2020 Shubham's Macbook Pro. All rights reserved.
//

import Foundation
import SwiftyJSON

class AdvertiseVideoModel: NSObject {
    var videoName, videoUrl, languauge : String!
    var videoId : Int!
    init(dict : [String : JSON]) {
        videoName = dict["videoName"]?.stringValue ?? ""
        videoUrl = dict["videoUrl"]?.stringValue ?? ""
        languauge = dict["languauge"]?.stringValue ?? ""
        videoId = dict["videoId"]?.intValue ?? 0
    }
}
