//
//  SalesAdvertiseVideoVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 20/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift

class SalesAdvertiseVideoVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXibs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupView()
    }
    
    //MARK:- Setup Function -
    
    func setupView(){
        self.navigationItem.title = "Advertise Video"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = false
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerAdvertiseVideoCell = UINib(nibName: "AdvertiseVideoCell", bundle: nil)
        self.tblView.register(registerAdvertiseVideoCell, forCellReuseIdentifier: "AdvertiseVideoCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewAdvertiseVideoCell(cell : AdvertiseVideoCell, indexPath : IndexPath) -> AdvertiseVideoCell {
        cell.btnActive.addTarget(self, action: #selector(active(sender:)), for: .touchUpInside)
        cell.btnplayVideo.addTarget(self, action: #selector(playVideo(sender:)), for: .touchUpInside)
        cell.btnDeactive.addTarget(self, action: #selector(deactive(sender:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(delete(sender:)), for: .touchUpInside)
        return cell
    }
    
    //MARK:- Action -
    
    @IBAction func btnMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
    }
    @objc func active(sender: UIButton!) {
        
    }
    @objc func deactive(sender: UIButton!) {
        
    }
    @objc func playVideo(sender: UIButton!) {
        
    }
    @objc func delete(sender: UIButton!) {
        
    }
    @IBAction func btnaddVideo(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "SalesAddVideoVC") as! SalesAddVideoVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
//MARK:- TableView Delgate and Datasource -

extension SalesAdvertiseVideoVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertiseVideoCell") as! AdvertiseVideoCell
        return populateTableViewAdvertiseVideoCell(cell: cell, indexPath: indexPath)
    }
}

