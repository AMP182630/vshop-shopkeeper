//
//  VideoCallVC.swift
//  VideoConferenceDemo
//
//  Created by Nimit Bagadiya on 16/10/19.
//  Copyright © 2019 Nimit Bagadiya. All rights reserved.
//

import UIKit
import AVFoundation

class VideoCallVC: UIViewController {
    
    //MARK:- Outlets -
    
    @IBOutlet weak var viewOpponent: UIView!
    @IBOutlet weak var btnmuteAudio: UIButton!
    @IBOutlet weak var btnhangUp: UIButton!
    @IBOutlet weak var btnflipCamera: UIButton!
    @IBOutlet weak var btnclickItem: UIButton!
    @IBOutlet weak var btnpurchaseComplete: UIButton!
    @IBOutlet weak var btnmuteVideo: UIButton!
    @IBOutlet weak var viewUserVideo: UIView!
    @IBOutlet weak fileprivate var clsView: UICollectionView!
    @IBOutlet weak var imgnoitemSelected: UIImageView!
    
    //MARK:- Variables -
    
    var imageProduct = UIImage()
    var arrImages = [UIImage]()
    
    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXibs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        btnpurchaseComplete.isUserInteractionEnabled = false
    }
    //MARK:- Register XIB -
    
    func registerXibs() {
        let registerClickedItemsCell = UINib(nibName: "ClickedItemsCell", bundle: nil)
        self.clsView.register(registerClickedItemsCell, forCellWithReuseIdentifier: "ClickedItemsCell")
    }
    
    //MARK:- POPULATE TABLE VIEW CELL -
    
    fileprivate func populateCollectionClickedItemsCell(cell : ClickedItemsCell, indexPath : IndexPath) -> ClickedItemsCell {
        cell.imgselectedProduct.image = arrImages[indexPath.row]
        return cell
    }
    
    //MARK:- Setup Function -
    
    func setUpView(){
        btnhangUp.layer.cornerRadius = 15
        btnmuteAudio.layer.cornerRadius = 15
        btnmuteVideo.layer.cornerRadius = 15
        viewOpponent.layer.borderWidth = 1
        viewOpponent.layer.borderColor = UIColor.init(red: 20/255, green: 11/255, blue: 116/255, alpha: 1).cgColor
        btnclickItem.layer.cornerRadius = 5
        btnpurchaseComplete.layer.cornerRadius = 5
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK:- Actions -
    
    @IBAction func btnmuteVideo(_ sender: Any) {
        
    }
    @IBAction func btnflipCamera(_ sender: Any) {
        
    }
    @IBAction func btnhangUp(_ sender: Any) {
        
    }
    @IBAction func btnmuteAudio(_ sender: Any) {
        
    }
    @IBAction func btnclickItem(_ sender: Any) {
        let render = UIGraphicsImageRenderer(size: self.viewOpponent.bounds.size)
        imageProduct = render.image { (context) in
            self.viewOpponent.drawHierarchy(in: self.viewOpponent.bounds, afterScreenUpdates: true)
        }
        arrImages.append(imageProduct)
        if arrImages.count == 0{
            btnpurchaseComplete.isUserInteractionEnabled = false
            btnpurchaseComplete.backgroundColor = UIColor.init(red: 217/255, green: 214/255, blue: 252/255, alpha: 1)
            imgnoitemSelected.isHidden = false
        }else{
            btnpurchaseComplete.isUserInteractionEnabled = true
            btnpurchaseComplete.backgroundColor = UIColor.init(red: 19/255, green: 10/255, blue: 116/255, alpha: 1)
            imgnoitemSelected.isHidden = true
        }
        clsView.reloadData()
    }
    @IBAction func btnpurchaseComplete(_ sender: Any) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "NewUserAddressVC") as! NewUserAddressVC
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    //MARK:- Prepare Camera -
    
    func prepareCamera() {
    }
}

extension VideoCallVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //MARK:- COLLECTION VIEW DELEGATES -
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clsView.dequeueReusableCell(withReuseIdentifier: "ClickedItemsCell", for: indexPath) as! ClickedItemsCell
        return populateCollectionClickedItemsCell(cell: cell, indexPath: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "AddProductPriceVC") as! AddProductPriceVC
        nav.product = arrImages[indexPath.row]
        nav.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(nav, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (self.clsView.frame.width - 10) / 4, height: (self.clsView.frame.width - 10))
    }
}
