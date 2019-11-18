//
//  AddVideoVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class AddVideoVC: UIViewController,UITextFieldDelegate {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtvideoLink: UITextField!
    @IBOutlet weak var txtvideofilePath: UITextField!
    @IBOutlet weak var topFilepath: NSLayoutConstraint!
    @IBOutlet weak var lblfilePath: UILabel!
    @IBOutlet weak var lblSaperetor: UILabel!
    @IBOutlet weak var btnuploadVideo: UIButton!
    @IBOutlet weak var topuploadVideo: NSLayoutConstraint!
    @IBOutlet weak var heighttxtFIlepath: NSLayoutConstraint!
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = "Add Video"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        txtvideoLink.delegate = self
        txtvideofilePath.isHidden = true
        lblfilePath.isHidden = true
        lblSaperetor.isHidden = true
        topFilepath.constant = 0
        topuploadVideo.constant = 15
        heighttxtFIlepath.constant = 0
    }
    
    //MARK:- Actions -
    
    @IBAction func btnuploadVideo(_ sender: Any) {
        
    }
    @IBAction func btnSubmit(_ sender: Any) {
        
    }
    
    //MARK:- TEXT VIEW DELEGATE -
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if self.txtvideoLink.text!.count > 0 {
            btnuploadVideo.backgroundColor = UIColor.blue
        }else{
            btnuploadVideo.backgroundColor = UIColor.init(red: 20/255, green: 11/255, blue: 116/255, alpha: 1)
        }
        return true
    }
    private func textViewDidEndEditing(_ textView: UITextView) {
        if txtvideoLink.text!.count > 0{
            btnuploadVideo.backgroundColor = UIColor.blue
        }else{
            btnuploadVideo.backgroundColor = UIColor.init(red: 20/255, green: 11/255, blue: 116/255, alpha: 1)
        }
    }
}
