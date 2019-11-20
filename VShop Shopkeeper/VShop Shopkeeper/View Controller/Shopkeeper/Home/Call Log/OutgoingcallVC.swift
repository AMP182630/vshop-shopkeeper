//
//  OutgoingcallVC.swift
//  VideoConferenceDemo
//
//  Created by Nimit Bagadiya on 16/10/19.
//  Copyright © 2019 Nimit Bagadiya. All rights reserved.
//

import UIKit

class OutgoingcallVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var imgRemotePerson: UIImageView!
    
    //MARK:- Variables -
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setUp()
    }
    
    //MARK:- Setup Fucntion -
    
    func setUp(){
        viewImage.layer.borderWidth = 1
        viewImage.layer.borderColor = UIColor.white.cgColor
        self.navigationController?.isNavigationBarHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "VideocallVC") as! VideocallVC
            self.navigationController?.pushViewController(nav, animated: true)
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            
        }
    }
    
    //MARK:- Actions -
    
    @IBAction func btnhangUp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
