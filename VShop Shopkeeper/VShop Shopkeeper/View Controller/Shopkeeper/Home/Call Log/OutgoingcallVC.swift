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
    
    var iscomefrom = Bool()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setUp()
    }
    
    //MARK:- Setup Fucntion -
    
    func setUp(){
        viewImage.layer.borderWidth = 1
        viewImage.layer.borderColor = UIColor.white.cgColor
        self.navigationController?.isNavigationBarHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            if self.iscomefrom == true{
                if let nav = Storyboard.salesrequestcallBack.instantiate(viewController: VideoCallVC.self){
                    self.navigationController?.pushViewController(nav, animated: true)
                }
            }else{
                let nav = self.storyboard?.instantiateViewController(withIdentifier: "VideocallVC") as! VideocallVC
                self.navigationController?.pushViewController(nav, animated: true)
            }
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
    //MARK:- Actions -
    
    @IBAction func btnhangUp(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
