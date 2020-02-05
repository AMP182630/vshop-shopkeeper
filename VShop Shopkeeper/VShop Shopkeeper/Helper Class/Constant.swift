//
//  Constant.swift
//  GlamBolt
//
//  Created by Parth Patel on 12/07/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import UIKit

class Constant: NSObject {
    
    
    struct Storyboards
    {
        static let Main = UIStoryboard.init(name: "Main", bundle: nil)
        static let Login = UIStoryboard.init(name: "Login", bundle: nil)
        static let CheckOut = UIStoryboard.init(name: "CheckOut", bundle: nil)
        static let MyBooking = UIStoryboard.init(name: "MyBooking", bundle: nil)
    }
    struct baseURL {
        static let apiBaseUrl = "https://php2.shaligraminfotech.com/beauty-app/public/api/"
        static let imageBaseUrl = "https://php2.shaligraminfotech.com/beauty-app/public/images/"
        static let portfolioImageBaseUrl = "https://php2.shaligraminfotech.com/beauty-app/public/"
    }
    struct postURL {
        static let getUserRegister = "auth/register"
        static let loginUser = "auth/login"
        static let forgotPassword = "auth/forgot-password"
        static let changePassword = "auth/change-password"
        static let getProfile = "get-profile-detail?userId="
        static let logout = "auth/logout"
        static let getServiceList = "get-services-list"
        static let getSubServiceList = "get-sub-services-list"
        static let getSubServiceDetails = "get-sub-service-details"
        static let getAllSubServiceList = "get-all-sub-services-list"
        static let searchSubServiceList = "search-sub-services-list"
        static let addToCart = "post-cart-list"
        static let getCartDetails = "get-cart-details?userId="
        static let deleteCartList = "delete-cart-list"
        static let updateCart = "edit-cart"
        static let getProfessionalList = "get-professional-list"
        static let searchProfessionalList = "get-filter-professional-list"
        static let getPopularService = "get-popular-services"
        static let getProfessionalDetails = "get-professional-details?serviceProviderId="
        static let postServiceReview = "post-service-review"
        static let getReferCode = "get-refer-code?userId="
        static let deleteCartItem = "delete-cart"
        static let updateProfile = "edit-profile"
        static let getDistance = "get-distance-list"
        static let getAboutUs = "get-about-us"
        static let addCard = "add-card"
        static let getCardList = "get-card-list"
        static let deleteCard = "delete-card"
        static let summaryOrder = "get-summary-before-booking"
        static let bookOrder = "book-order"
        static let getClientBooking = "get-client-bookings"
        static let getClientBookingDetails = "get-client-booking-detail"
        static let getNotificationList = "get-client-notification-list"
        static let getPrivacyPolicy = "get-privacy-policy"
        static let getTermsAndCondition = "get-terms-conditions"
        static let checkCouponCode = "check-coupon-code"
        static let deleteCouponCode = "remove-coupon-code"
        static let getUserWallet = "get-user-wallet"
        static let useWallet = "use-wallet"
        static let deleteWallet = "remove-wallet"
        static let modifyBooking = "edit-booking"
    }
    struct defaultValues {
        static let PullToRefresh = "Pull to refresh"
    }
    struct DeviceToken {
        static var deviceToken = String()
    }
    struct udid {
        static var deviceUdid = UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    struct General {
        static let userdefaults:UserDefaults = UserDefaults.standard
    }
    struct Color {
        static let multiplyColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
    }
    struct ScreenSize { // Answer to OP's question
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let screenWidth = UIScreen.main.bounds.size.width
        static let screenHeight = UIScreen.main.bounds.size.height
    }
    struct DeviceType { //Use this to check what is the device kind you're working with
        
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_SE         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0 //320
        static let IS_IPHONE_7          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0 //375
        static let IS_IPHONE_7PLUS      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0 // 414
        static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
        static let IS_IPHONE_X_MAX      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 896.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
}
