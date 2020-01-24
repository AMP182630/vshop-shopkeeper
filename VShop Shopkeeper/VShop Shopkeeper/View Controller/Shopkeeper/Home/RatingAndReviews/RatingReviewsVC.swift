//
//  RatingReviewsVC.swift
//  VShop Shopkeeper
//
//  Created by Shubham's Macbook Pro on 18/11/19.
//  Copyright © 2019 Shubham's Macbook Pro. All rights reserved.
//

import UIKit
import SideMenuSwift
import SwiftyJSON
import FloatRatingView

class RatingReviewsVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Variables -
    
    var refreshControl = UIRefreshControl()
    var counter = 3
    public var arrReviewList = [ReviewModel]()
    public var page = Int()
    public var totalRecords = Int()
    
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
        self.navigationItem.title = "Rating & Review"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = false
        SideMenuController.preferences.basic.menuWidth = self.view.frame.width
        
        refreshControl.attributedTitle = NSAttributedString(string: Constant.defaultValues.PullToRefresh)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        tblView.addSubview(refreshControl)
    }
    
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerRatingReviewCell = UINib(nibName: RatingReviewCell.staticIdentifier, bundle: nil)
        self.tblView.register(registerRatingReviewCell, forCellReuseIdentifier: RatingReviewCell.staticIdentifier)
    }
    
    //MARK:- Functions -
    
    fileprivate func pagination() {
        counter += 10
        tblView.reloadData()
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateTableViewRatingReviewCell(cell : RatingReviewCell, indexPath : IndexPath) -> RatingReviewCell {
        /*     cell.lblName.text = arrReviewList[indexPath.row].customerName
         cell.lblReviews.text = arrReviewList[indexPath.row].comment
         if let rating = arrReviewList[indexPath.row].rating {
         if rating != "" {
         cell.viewRating.rating = Double(Float(rating)!)
         } else {
         cell.viewRating.rating = 0
         }
         } */
        return cell
    }
    
    //MARK:- Action -
    
    //MARK:- REFRESH SERVICES
    
    @objc func refresh(sender:AnyObject) {
        counter += 1
        self.page = 0
        tblView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @IBAction func btnMenu(_ sender: Any) {
        self.sideMenuController?.revealMenu()
    }
    @IBAction func btnNotification(_ sender: Any) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
}
//MARK:- TableView Delgate and Datasource -

extension RatingReviewsVC : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RatingReviewCell.staticIdentifier) as! RatingReviewCell
        return populateTableViewRatingReviewCell(cell: cell, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = counter - 1
        if indexPath.row == lastItem {
            pagination()
        }
    }
}

extension RatingReviewsVC {
    
    //MARK:- API RATING & REVIEW LIST
    
    fileprivate func apiReviewList() {
        let userId = UserDefaults.standard.value(forKey:"user_id") as? Int ?? 0
        RequestManager.getAPIWithURLString(urlPart:"\("")\(userId)",successResult: { (response,statuscode) in
            let jsonData = JSON(response)
            if jsonData[kSuccess] == true {
                if let dict = jsonData[kData].dictionary {
                    self.totalRecords = dict["totalRecords"]?.int ?? 0
                    if let arrList = dict["data"]?.array {
                        if arrList.count != 0 {
                            if self.page == 0 {
                                self.arrReviewList = arrList.compactMap({(dict) -> ReviewModel in ReviewModel(dict: dict.dictionaryValue)})
                            } else {
                                for dict in arrList {
                                    self.arrReviewList.append(ReviewModel(dict: dict.dictionaryValue))
                                }
                            }
                            self.tblView.reloadData()
                        }
                    }
                    self.refreshControl.endRefreshing()
                    
                }
            } else {
                if let messages = jsonData["error"].string {
                    if messages.count > 0{
                        Utility.showAlert(message: messages, controller: self, alertComplition: { (action) in
                        })
                    }
                }
            }
        })
        { (error) in
            Utility.showAlert(message: error.localizedDescription, controller: self, alertComplition: { (completion) in
            })
        }
    }
}
