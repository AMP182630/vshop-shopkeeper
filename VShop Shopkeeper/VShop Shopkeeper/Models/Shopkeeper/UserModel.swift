//
//  UserModel.swift
//  VShop Shopkeeper
//
//  Created by MAC on 20/01/20.
//  Copyright © 2020 Shubham's Macbook Pro. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel: NSObject {
    var storeName, ownerFirstName, ownerLastName, mobileNumber,image, emailAddress, storeAddress, storeLatitude, storeLongitude, shopNameNumber, city, state, PANCardNumber, PANFrontPhoto, PANBackPhoto, GSTNumber, GSTFrontPhoto, GSTBackPhoto, adharNumber, adharFrontPhoto, adharBackPhoto, registrationNumber, registrationFrontPhoto, registrationBackPhoto, otherDocumentNumber, documentFrontPhoto, documentBackPhoto : String!
    var userId : Int!
    
    init(dict : [String : JSON]) {
        storeName = dict["storeName"]?.stringValue ?? ""
        ownerFirstName = dict["ownerFirstName"]?.stringValue ?? ""
        ownerLastName = dict["ownerLastName"]?.stringValue ?? ""
        mobileNumber = dict["mobileNumber"]?.stringValue ?? ""
        userId = dict["userId"]?.intValue ?? 0
        image = dict["imageUrl"]?.stringValue ?? ""
        emailAddress = dict["emailAddress"]?.stringValue ?? ""
        storeAddress = dict["storeAddress"]?.stringValue ?? ""
        storeLatitude = dict["storeLatitude"]?.stringValue ?? ""
        storeLongitude = dict["storeLongitude"]?.stringValue ?? ""
        shopNameNumber = dict["shopNameNumber"]?.stringValue ?? ""
        city = dict["city"]?.stringValue ?? ""
        state = dict["state"]?.stringValue ?? ""
        PANCardNumber = dict["PANCardNumber"]?.stringValue ?? ""
        PANFrontPhoto = dict["PANFrontPhoto"]?.stringValue ?? ""
        PANBackPhoto = dict["PANBackPhoto"]?.stringValue ?? ""
        GSTNumber = dict["GSTNumber"]?.stringValue ?? ""
        GSTFrontPhoto = dict["GSTFrontPhoto"]?.stringValue ?? ""
        GSTBackPhoto = dict["GSTBackPhoto"]?.stringValue ?? ""
        adharNumber = dict["adharNumber"]?.stringValue ?? ""
        adharFrontPhoto = dict["adharFrontPhoto"]?.stringValue ?? ""
        adharBackPhoto = dict["adharBackPhoto"]?.stringValue ?? ""
        registrationNumber = dict["registrationNumber"]?.stringValue ?? ""
        registrationFrontPhoto = dict["registrationFrontPhoto"]?.stringValue ?? ""
        registrationBackPhoto = dict["registrationBackPhoto"]?.stringValue ?? ""
        otherDocumentNumber = dict["otherDocumentNumber"]?.stringValue ?? ""
        documentFrontPhoto = dict["documentFrontPhoto"]?.stringValue ?? ""
        documentBackPhoto = dict["documentBackPhoto"]?.stringValue ?? ""
    }
}
