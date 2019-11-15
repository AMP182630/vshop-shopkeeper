//
//  EnumManager.swift
//  GTPUser
//
//  Created by Nimit Bagadiya on 6/25/19.
//  Copyright © 2019 baps. All rights reserved.
//

import UIKit

enum BookingTypeRepairer : Int {
    case New = 1
    case Accepted = 2
    case Completed = 3
}

enum BookingStatus : String{
    case New = "0"
    case Accepted = "1"
    case Decline = "2"
    case CustomerConfirm = "3"
    case SendPickupboy = "4"
    case StartRepairing = "5"
    case ServiceDone = "6"
    case DeliveryBoyOnTheWay = "7"
    case DeliveryAndPaymentDone = "8"
}

enum BookingType : Int {
    case PickUp = 0
    case Onsite = 1
    case WaitingForResponse = 2
    case CustomerConfirm = 3
    case Complete = 4
}

class EnumManager: NSObject {
    
}
