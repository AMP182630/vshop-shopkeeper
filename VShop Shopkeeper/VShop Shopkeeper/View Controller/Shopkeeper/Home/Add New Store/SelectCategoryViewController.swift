//
//  SelectCategoryViewController.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 25/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class SelectCategoryViewController: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet var categoryTableView: UITableView!
    
    //MARK:- Private Variables -
    
    let categoryList = ["Electronics", "TVs", "Fashion", "Home", "Clothes"]
    var selectedarray : NSMutableArray = NSMutableArray()
    
    //MARK:- Life Cycle Methods -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewConfiguration()
    }
    
    //MARK:- Setup Methods -
    
    fileprivate func viewConfiguration() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.view.tintColor = UIColor.white
        self.navigationItem.title = "Category"
        
        let selectCategoryNib = UINib.init(nibName: "CategoryTableViewCell", bundle: nil)
        self.categoryTableView.register(selectCategoryNib, forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    fileprivate func populateCategoryListCell(cell: CategoryTableViewCell, indexPath: IndexPath) -> CategoryTableViewCell {
        cell.categoryListLabel.text = categoryList[indexPath.row]
        
        if selectedarray.contains(categoryList[indexPath.row]){
            cell.categorySelectionImage.isHidden = false
            cell.imageWidthConstant.constant = 24
        }
        else {
            cell.categorySelectionImage.isHidden = true
            cell.imageWidthConstant.constant = 0
        }
        return cell
    }
}

//MARK:- Tableview Delegate & DataSource -

extension SelectCategoryViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = categoryTableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        return populateCategoryListCell(cell: categoryCell, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CategoryTableViewCell {
            if selectedarray.contains(categoryList[indexPath.row]){
                cell.categorySelectionImage.isHidden = false
                cell.imageWidthConstant.constant = 24
                selectedarray.remove(categoryList[indexPath.row])
            }
            else
            {
                cell.categorySelectionImage.isHidden = true
                cell.imageWidthConstant.constant = 0
                selectedarray.add(categoryList[indexPath.row])
            }
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}
