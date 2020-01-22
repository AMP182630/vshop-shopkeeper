//
//  AppDelegate.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 14/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SideMenuSwift

var dictList : UserModel?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        navigationBarSetUp()
        return true
    }
    
    func navigationBarSetUp(){
        SideMenuController.preferences.basic.enablePanGesture = true
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        
        if UserDefaults.standard.value(forKey:"otpVerify") as? String ?? "" != "" {
               let rootViewController = Storyboard.main.instantiate(viewController: SideMenuController.self)
               let tabbarVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SalesExecutiveVC")
               let appDelegate = UIApplication.shared.delegate as! AppDelegate
               appDelegate.window?.rootViewController = rootViewController
           }
    }
}

