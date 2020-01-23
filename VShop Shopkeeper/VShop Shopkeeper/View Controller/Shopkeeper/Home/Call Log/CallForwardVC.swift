//
//  CallForwardVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit

class CallForwardVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var name = ["Shubham","Neel","Parth","Akash","Tushar","Nimit","Nidhi"]
    
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
        
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerCallForwardCell = UINib(nibName: CallForwardCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerCallForwardCell, forCellReuseIdentifier: CallForwardCell.staticIdentifier)
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewCallForwardCell(cell : CallForwardCell, indexPath : IndexPath) -> CallForwardCell {
        cell.lblName.text = name[indexPath.row]
        cell.btnCall.addTarget(self, action: #selector(call(sender:)), for: .touchUpInside)
        return cell
    }
    
    //MARK:- Action -
    
    @IBAction func btnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func call(sender: UIButton!) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "OutgoingcallVC") as! OutgoingcallVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
}

//MARK:- TableView Delgate and Datasource -

extension CallForwardVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CallForwardCell.staticIdentifier) as! CallForwardCell
        return populateTableViewCallForwardCell(cell: cell, indexPath: indexPath)
    }
}
