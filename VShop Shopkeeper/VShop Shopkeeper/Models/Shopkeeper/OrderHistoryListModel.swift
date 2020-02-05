//
//  OrderHistoryListModel.swift
//  VShop Shopkeeper
//
//  Created by MAC on 20/01/20.
//  Copyright © 2020 Shubham's Macbook Pro. All rights reserved.
//

import Foundation
import SwiftyJSON

class OrderHistoryListModel: NSObject {
    var customerName, customerImage, customerOrderId, quantity,price, status, date, creditCard, transactionId, totalItemPrice, totalItem, deliveryCharge, GST, AppliedPromotion, AppliedPromotionPrice, TotalAmount : String!
    var customerId : Int!
    var arrItemList = [ItemListModel]()
    
    init(dict : [String : JSON]) {
        customerName = dict["customerName"]?.stringValue ?? ""
        customerImage = dict["customerImage"]?.stringValue ?? ""
        customerOrderId = dict["customerOrderId"]?.stringValue ?? ""
        customerId = dict["customerId"]?.intValue ?? 0
        quantity = dict["quantity"]?.stringValue ?? ""
        price = dict["price"]?.stringValue ?? ""
        status = dict["status"]?.stringValue ?? ""
        date = dict["date"]?.stringValue ?? ""
        if let paymentMethod = dict["paymentMethod"]?.dictionaryValue {
            creditCard = paymentMethod["creditCard"]?.stringValue ?? ""
            transactionId = paymentMethod["transactionId"]?.stringValue ?? ""
        }
        if let priceDetails = dict["priceDetails"]?.dictionaryValue {
            totalItemPrice = priceDetails["totalItemPrice"]?.stringValue ?? ""
            totalItem = priceDetails["totalItem"]?.stringValue ?? ""
            deliveryCharge = priceDetails["deliveryCharge"]?.stringValue ?? ""
            GST = priceDetails["GST"]?.stringValue ?? ""
            AppliedPromotion = priceDetails["AppliedPromotion"]?.stringValue ?? ""
            AppliedPromotionPrice = priceDetails["AppliedPromotionPrice"]?.stringValue ?? ""
            TotalAmount = priceDetails["TotalAmount"]?.stringValue ?? ""
        }
        if let arrItems = dict["items"]?.array {
            self.arrItemList = arrItems.compactMap({(dict) -> ItemListModel in ItemListModel(dict: dict.dictionaryValue)})
        }
    }
}
class ItemListModel: NSObject {
    var price , quantity , productImage: String!
    
    init(dict : [String : JSON]) {
        price = dict["price"]?.stringValue ?? ""
        quantity = dict["quantity"]?.stringValue ?? ""
        productImage = dict["productImage"]?.stringValue ?? ""
    }
}
