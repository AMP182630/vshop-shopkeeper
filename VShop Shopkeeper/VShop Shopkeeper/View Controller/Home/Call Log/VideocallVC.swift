//
//  VideocallVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class VideocallVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var viewopponentVideo: UIView!
    @IBOutlet weak var btncallForward: UIButton!
    @IBOutlet weak var btnhangUp: UIButton!
    @IBOutlet weak var imgopponentMute: UIImageView!
    @IBOutlet weak var viewuserVideo: UIView!
    @IBOutlet weak var imguserMute: UIImageView!
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Actions -
    
    @IBAction func btncallForward(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "CallForwardVC") as! CallForwardVC
        nav.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(nav, animated: true, completion: nil)
    }
    @IBAction func btnhangUp(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
