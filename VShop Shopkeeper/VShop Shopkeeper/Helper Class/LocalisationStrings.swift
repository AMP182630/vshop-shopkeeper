//
//  LocalisationStrings.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 23/01/20.
//  Copyright © 2020 Shubham's Macbook Pro. All rights reserved.
//

import Foundation
import UIKit

class LocalisationStrings: NSObject {
    
    struct AlertMessage {
        static let PleaseEnterFirstName = "Please enter first name"
        static let PleaseEnterLastName = "Please enter last name"
        static let PleaseEnterContactNumber = "Please enter contact number"
        static let PleaseEnterValidMobileNumber = "Please enter valid contact number"
        static let PleaseEnterValidPassword = "Please enter password"
        static let pleaseEnterEmail = "Please enter email address"
        static let invitationSendSuccessfully = "Invitation send successfully"
        static let donthaveCamera = "You don't have camera"
        static let removeVideo = "Are you sure to remove this video?"
        static let logout = "Are you sure you want to logout?"
    }
    struct NavigationTitle {
        static let permission = "Permission"
        static let updateSalesExecutive = "Update Sales Executive"
        static let salesExecutive = "Sales Executive"
        static let orderDetail = "Order Detail"
        static let orderHistory = "Order History"
        static let addSalesExecutive = "Add Sales Executive"
        static let callLog = "Call Log"
        static let inviteTitle = "Invite"
    }
}
