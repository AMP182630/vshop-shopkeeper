//
//  Utility.swift
//  GlamBolt
//
//  Created by baps on 16/04/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import SwiftyJSON

//typealias AlertOkComplition = (_ okPressed:Bool) -> Void

typealias AlertOkComplitionService = (_ okPressed:String) -> Void

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class Utility:NSObject{
    //MARK:- SET BACKGROUND COLOR
    
    class func bgColor(view:UIView) {
      
        view.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1)
       
    }
    //MARK:- Background Gradien -
    
    class func ApplyGradientBackground(view:UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        let colour1 = UIColor(red: 243.0/255.0, green: 244.0/255.0, blue: 247.0/255.0, alpha: 0.62).cgColor
        let colour2 = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors = [colour1,colour2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.1, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //MARK:- Apply shadow -
    
    class func applyCardShadow(image:UIImageView){
        image.clipsToBounds = false
        image.layer.shadowColor = UIColor.lightGray.cgColor
        image.layer.shadowOpacity = 1
        image.layer.shadowOffset =  CGSize(width: 0.5, height: 1.0)
        image.layer.shadowRadius = 5.0
    }
    
    class func applyViewShadow(view:UIView){
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.15).cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset =  CGSize(width: -3.0, height: 5.0)
        view.layer.shadowRadius =  3.0
        view.layer.cornerRadius = 3.0
    }
    
    class func applyMarchentShadow(view:UIView){
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.1).cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset =  CGSize(width: -3.0, height: 5.0)
        view.layer.shadowRadius = 3.0
    }
    
    class func applyShadowToCard(view:UIView){
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset =  CGSize(width: 0.5, height: 2.0)
        view.layer.shadowRadius = 3.0
    }
    
    //MARK:- FONT NAME AND SIZE
    
    class func appFont(size:CGFloat) -> UIFont {
        let appFont = UIFont(name: "Poppins-SemiBold", size: size)
        return appFont!
    }
    
    //MARK:- Email Validation -
    
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //MARK:- Alert -
    
    class func showAlert (message : String , controller : UIViewController,alertComplition : @escaping AlertOkComplition ){
        
        let alertView = UIAlertController(title: "VShop", message: message, preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertComplition(true)
        }
//        alertOk.setValue(UIColor(red: 212/255, green: 156/255, blue: 150/255, alpha: 1), forKey: "titleTextColor")
        alertView.addAction(alertOk)
        
        controller.present(alertView, animated: true)
    }
    
    class func showAlertWithTwoBtns (messgae : String , controller : UIViewController,alertComplition : @escaping AlertOkComplition ){
        
        let alertView = UIAlertController(title: "Glambolt", message: messgae, preferredStyle: .alert)
        let alertYes = UIAlertAction(title: "Yes", style: .default) { (action) in
            alertComplition(true)
        }
        let alertNo = UIAlertAction(title: "No", style: .default) { (action) in
            alertComplition(false)
        }
        alertYes.setValue(UIColor(red: 212/255, green: 156/255, blue: 150/255, alpha: 1), forKey: "titleTextColor")
        alertView.addAction(alertYes)
        alertView.addAction(alertNo)
        
        controller.present(alertView, animated: true)
    }
  
    class func showAlertForService (messgae : String , controller : UIViewController,alertComplition : @escaping AlertOkComplitionService ){
        
        let alertView = UIAlertController(title: "Glambolt", message: messgae, preferredStyle: .alert)
        let alertSalon = UIAlertAction(title: "Salon", style: .default) { (action) in
            alertComplition("salon")
        }
        let alertProfessional = UIAlertAction(title: "Professional", style: .default) { (action) in
            alertComplition("professional")
        }
        let alertCancel = UIAlertAction(title: "Cancel", style: .default) { (action) in
            alertComplition("cancel")
        }
        alertSalon.setValue(UIColor(red: 212/255, green: 156/255, blue: 150/255, alpha: 1), forKey: "titleTextColor")
        alertProfessional.setValue(UIColor(red: 212/255, green: 156/255, blue: 150/255, alpha: 1), forKey: "titleTextColor")
        alertCancel.setValue(UIColor(red: 212/255, green: 156/255, blue: 150/255, alpha: 1), forKey: "titleTextColor")
        alertView.addAction(alertSalon)
        alertView.addAction(alertProfessional)
        alertView.addAction(alertCancel)
        controller.present(alertView, animated: true)
    }
    
    //MARK:- CONVERT DATE INTO STRING
    
    class func dateAndTime(date:String, inputDateFormat:String, outputDateFormat:String)-> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputDateFormat
        let showDate = inputFormatter.date(from: date)
        inputFormatter.dateFormat = outputDateFormat
        if showDate == nil {
            return ""
        } else {
            print(inputFormatter.string(from: showDate!))
            return inputFormatter.string(from: showDate!)
        }
    }
    
    //MARK:- Change TextFiield Placeholder -
    
    class func changePlaceholder(textField:UITextField){
        textField.attributedPlaceholder = NSAttributedString(string: "Search Location",
                                                             attributes: [NSAttributedString.Key.foregroundColor:  UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)])
    }

    //MARK:- DashBorder to View -
    
    class func setDashborder(view : UIView) {
        let border = CAShapeLayer()
        border.strokeColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1).cgColor
        border.fillColor = nil
        border.lineDashPattern = [4, 4]
        border.path = UIBezierPath(rect: view.bounds).cgPath
        border.frame = view.layer.bounds
        view.layer.addSublayer(border)
    }
    
    //MARK: - MBProgressHud -

    class func showHud(){
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate
            MBProgressHUD.showAdded(to: ((appDelegate?.window)!)!, animated: true)
        }
    }
    
    class func hideHud() {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate
            MBProgressHUD.hide(for: ((appDelegate?.window)!)!, animated: true)
        }
    }
    
    //MARK:- AddShadow
    
    class func addShadow(view: UIView,shadowColor : CGColor, shadowOffset : CGSize, shadowOpacity : Float, shadowRadius : CGFloat, cornerRadius : CGFloat){
        view.layer.shadowColor = shadowColor
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowRadius = shadowRadius
        view.layer.cornerRadius = cornerRadius
        if view.isKind(of: UIButton.self) || view.isKind(of: UIView.self) {
            view.layer.masksToBounds = false
        }
    }
    
    //MARK:- DISMISS GIF
    
    class func dismissGIF() {
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
//            GIFHUD.shared.dismiss(completion: nil)
        }
    }
    //MARK:- Facebook Login -
//    class func loginWithFacebook(controller: UIViewController, completionHandler: @escaping (_ result: Bool) -> Void){
//
////        let loginManager = LoginManager()
//        loginManager.logOut()
//        loginManager.logIn(permissions: [ .publicProfile,.email], viewController: controller) { loginResult in
//
//            switch loginResult {
//            case .failed(let error):
//                print(error)
//            case .cancelled:
//                print("User cancelled login.")
//            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
//                print(grantedPermissions)
//                print(declinedPermissions)
//                print(accessToken)
//
//                Utility.getFacebookUserData(completionHandler: { (success) in
//                    if success == true{
//                        completionHandler(true)
//                    }
//                    else{
//                        completionHandler(false)
//                    }// return data & close
//                })
//
//                break
//            }
//            //}
//        }
//    }
    
//    class func getFacebookUserData(completionHandler: @escaping (_ result: Bool) -> Void){
//            if((AccessToken.current) != nil){
//            let defaults = UserDefaults.standard
//            defaults.set(AccessToken.current!.tokenString, forKey: "FBToken")
//
//            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email, gender, birthday"]).start(completionHandler: { (connection, result, error) -> Void in
//
//                if (error == nil){
//
//                    let jsonData = JSON(result ?? "")
//                    if let dict = jsonData.dictionary {
//                        dictList = UserModel.init(dict: dict)
//                    }
//                    let fbDict : [String : Any] = ["email" : jsonData["email"].stringValue,
//                                                   "name" : jsonData["name"].stringValue,
//                                                   "id" : jsonData["id"].stringValue,
//                                                   "profile_pic" :jsonData["picture"]["data"]["url"].stringValue ]
//                    print(fbDict)
//
//                    let request = GraphRequest(graphPath: "\(fbDict["id"]!)", parameters: ["fields" : "id,name,email,birthday,gender,hometown" ], httpMethod: HTTPMethod(rawValue: "GET"))
//                    request.start(completionHandler: { (connection, result, error) in
//                        print(result!)
//                        // Handle the result
//                           })
//
//
//                    completionHandler(true) // return data & close
//                    //Sign In with Firebase
//                }
//                else{
//                    completionHandler(false) // return data & close
//                }
//            })
//        }
//        else{
//            print("Error In Fatch Data")
//            completionHandler(false) // return data & close
//        }
//    }

}
