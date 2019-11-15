//
//  ComplitionHandlerHelper.swift
//  GTPUser
//
//  Created by Nimit Bagadiya on 5/31/19.
//  Copyright © 2019 baps. All rights reserved.
//

import UIKit
import Photos
import AVKit

typealias SuccessHandler = (_ result:Any , _ status : Int) -> Void
typealias FailureHandler = (_ error:Error) -> Void
typealias DropdownSelectedItems = (_ arrSelectedItem : Array<String>) -> Void
typealias ConfirmationHandler = (_ isConfirm : Bool) -> Void
typealias PhotoPermissionHandler = (_ photoStatus : PHAuthorizationStatus) -> Void
typealias CameraPermissionHandler = (_ cameraStatus : AVAuthorizationStatus) -> Void
typealias AlertOkComplition = (_ okPressed:Bool) -> Void
typealias GeoCodingHandler = (_ placemark : CLPlacemark?,_ error : Error?) -> Void

class ComplitionHandlerHelper: NSObject {

}
