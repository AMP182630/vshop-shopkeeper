//
//  Storyboard.swift
//  Polycracy
//
//  Created by baps on 08/05/19.
//  Copyright © 2019 baps. All rights reserved.
//

import UIKit
enum Storyboard: String {
    
    case main = "Main"
    case logIn = "Login"
    case orderHistory = "OrderHistory"
    case addNewStore = "AddNewStore"
    case profile = "Profile"
    case invite = "Invite"
    case callLog = "CallLog"
    case requestcallBack = "RequestCallback"
    case ratingReviews = "RatingsAndReview"
    case advertisevideo = "AdvertiseVideo"
    case notification = "Notification"
    
    //Sales Executive
    case salescallLog = "SalesCallLog"
    case salesorderHistory = "SalesOrderHistory"
    case salesrequestcallBack = "SalesRequestCallback"
    case salesratingReviews = "SalesRatingsAndReview"
    case salesadvertisevideo = "SalesAdvertiseVideo"
    case salesprofile = "SalesProfile"
    
    func instantiate<T: UIViewController>(viewController type: T.Type) -> T? {
        let identifier = String(describing: type)
        let storyboard = UIStoryboard(name: rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    }
    
    func initial<T: UIViewController>() -> T? {
        let storyboard = UIStoryboard(name: rawValue, bundle: nil)
        return storyboard.instantiateInitialViewController() as? T
    }
}


