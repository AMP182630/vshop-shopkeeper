//
//  Constants.swift
//  GTPUser
//
//  Created by Nimit Bagadiya on 5/1/19.
//  Copyright © 2019 baps. All rights reserved.
//

import UIKit

class Constants: NSObject {

    struct StoryBoards {
        static let Login = UIStoryboard(name: "Login", bundle: nil)
        static let DashBoard = UIStoryboard(name: "Dashboard", bundle: nil)
        static let LeftMenu = UIStoryboard(name: "LeftMenu", bundle: nil)
        static let ReceiptDetail = UIStoryboard(name: "ReceiptDetail", bundle: nil)
        static let PaymentDetail = UIStoryboard(name: "PaymentDetail", bundle: nil)
        static let AddVehicle = UIStoryboard(name: "AddVehicle", bundle: nil)
        static let SearchRepairer = UIStoryboard(name: "SearchRepairer", bundle: nil)
        static let VMDashboard = UIStoryboard(name: "VMDashboard", bundle: nil)
        static let RepairerDetail = UIStoryboard(name: "RepairerDetail", bundle: nil)
        static let RepairerRegistration = UIStoryboard(name: "RepairerRegistration", bundle: nil)
        static let TeamMember = UIStoryboard(name: "TeamMember", bundle: nil)
    }
    struct ViewControllers {
        static let StoreImageViewController = "StoreImageViewController"
    }
    
    struct TableViewCell {
        static let NotificationTableViewCell = "NotificationTableViewCell"
    }
    
    struct General{
        static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    }
    
    struct AppColor {
        static let blueColor = UIColor(named: "BlueColor")
        static let redColor = UIColor(named: "RedColor")
        static let lightWhite = UIColor(named: "Background-Light")
        static let greenColor = UIColor(named: "GreenColor")
        static let lightGray = UIColor(named: "lightGray")
        static let borderColor = UIColor(named: "BorderColor")
        static let TextColor = UIColor(named: "TextColor")
        static let DarkGrayBackground = UIColor(named: "DarkGrayBackground")
    }
    
    struct AppFont {
        static let pageMenuFont = "Roboto-Medium"
        static let regularFont = "Roboto-Regular"
        
    }
    
    struct Notification {
        static let addVehicleNotification = NSNotification.Name("AddVehicle")
        static let reloadVehicleList = NSNotification.Name("ReloadVehicleList")
        static let scanQRCode = NSNotification.Name("scanQRCode")
        static let goToBookingDetail = NSNotification.Name("GoToBookingDetail")
        static let setAddressToRepairerList = NSNotification.Name("setAddressToRepairerList")
        static let refreshNewBookingAPI = NSNotification.Name("refreshNewBookingAPI")
        static let goToAcceptedPage = NSNotification.Name("goToAcceptedPage")
        static let refreshAcceptedAPI = NSNotification.Name("refreshAcceptedAPI")
        static let refreshUserProfile = NSNotification.Name("refreshUserProfile")
        static let reloadBookingDetail = NSNotification.Name("reloadBookingDetail")
    }
    
    struct baseURL {
//        "https://php10.shaligraminfotech.com/traffic_violation/public/api/"
        static let apiBaseUrl = "https://php3.shaligraminfotech.com/vehicle_maintenance/public/api/"
        static let imageBaseUrl = "https://php3.shaligraminfotech.com/vehicle_maintenance/storage/"
//        "https://php3.shaligraminfotech.com/vehicle_maintenance/storage/" //"https://php3.shaligraminfotech.com/vehicle_maintenance/public/"
    }
    
    struct PostURL {
        static let LoginEndUser = "repairerLogin"
        static let VerifyOTP = "repairerLogin/verify/otp"
        static let endUserProfile = "auth/update/end-user/profile"
        static let logout = "auth/logout/end-user"
        static let challanDetail = "check/challan"
        static let addVehicle = "add/vehicle"
        static let getChallanDetailFromQRCode = "check/challan/using-qr-code"
        static let payChallan = "pay/challan"
        
        static let getVehicleType = "get/vehicle-type"
        static let getMakeList = "get/make-list"
        static let getSavedAddress = "get/save-address-list"
        static let getBrandList = "get/brand-list"
        static let getSericeList = "get/service-list"
        
        static let saveSearchRepairs = "saveSearchRepairs"
        static let deleteAddress = "delete/address"
        static let saveAddress = "save/address"
        
        static let getReviewType = "get/review-types"
        static let saveReview = "save/review"
        
        static let getBrandServices = "get/all-brand-services"
        static let addProfileData = "add/repairer/profileData"
        static let addProfileImage = "add/repairer/profileImage"
        
        static let getRepairerList = "get/repairerList"
        
        static let addTeamMember = "add/teamMember"
        static let getTeamMember = "get/teamMembers"
        static let deleteTeamMember = "delete/teamMember"
        
        static let getBookingList = "get/repairer/bookingList"

        static let getRepairerProfile = "get/repairer/profile"
        
        static let changeBookingStatus = "change/bookingStatus"
        
        static let getBookingDetail = "get/booking/detail"
        
        static let bookingListUser = "get/booking/listUser"
        
        static let bookService = "book/service"
        
        static let newLogout = "logout"
    }
    
    struct GetURL {
        static let getVehicles = "get/vehicles"
        static let getVehicleChallan = "get/vehicle-challans"
        static let getMessage = "get/end-user/messages"
        static let getMessageDetail = "/get/end-user/messages-detail"
    }
    
    struct UserDefaults {
        static let loginDictionary = "LoginDictinary"
        static let currentLanguage = "CurrentLanguage"
        static let hasRubBefore = "HasRunBefore"
        static let selectedState = "SelectedState"
    }
    
    struct Keys {
        static let GoogleAPIKey = "AIzaSyAxPY7HYup5Dqji-aZDgUHafyjAFq87-dU"
        //AIzaSyCrx0QKkosWgNEsbLnnEoj-kh7KEsep8lk
//        AIzaSyDzPrKY8HJyr2cqCFxHw5c5V_hF7BlpI6I
    }
}
