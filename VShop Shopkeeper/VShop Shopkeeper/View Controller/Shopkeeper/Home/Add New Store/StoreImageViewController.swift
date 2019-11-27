//
//  StoreImageViewController.swift
//  VShopRomingStaff
//
//  Created by Shubham's Macbook Pro on 12/11/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit
import OpalImagePicker

class StoreImageViewController: UIViewController,PassArrayImgDelegate{
    
    //MARK:- OUTLETS
    
    @IBOutlet weak fileprivate var clsView: UICollectionView!
    @IBOutlet weak var lblnoStoreImage: UILabel!
    @IBOutlet weak var btnFinish: UIButton!
    
    //MARK:- FILEPRIVATE/PUBLIC VARIABLES
    
    var imgPickerObj = ImagePicker()
    var arrImages = [UIImage]()

    //MARK:- View Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK:- SETUP
    
    fileprivate func setupView() {
       self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
       self.navigationController?.view.tintColor = UIColor.white
       self.navigationItem.title = "Store Images"
        btnFinish.isHidden = true
    }
    
    //MARK:- ACTION
    
    @IBAction func btnNotification(_ sender: UIBarButtonItem) {
        let controller = Storyboard.notification.instantiate(viewController: NotificationViewController.self)
        self.navigationController?.pushViewController(controller ?? self, animated: true)
    }
    
    @IBAction func btnFinish(_ sender: Any) {
        self.navigationController!.popToRootViewController(animated: true)
    }
    @IBAction fileprivate func btnaddImage(_ sender: Any) {
        arrayImgdelegate = self
        imgPickerObj.currentViewController = self
        imgPickerObj.cameFrom = "StoreImageViewController"
        imgPickerObj.actionSheet()
    }
    
    @objc func addStoreTapped(_ imageView : Any) {
        arrayImgdelegate = self
        imgPickerObj.currentViewController = self
        imgPickerObj.cameFrom = Constants.ViewControllers.StoreImageViewController
        imgPickerObj.actionSheet()
    }
    
    //MARK:- SELECTED IMAGE FROM CAMERA/GALLERY -
    
    public func selectedArrayImage(arrImg: [UIImage]) {
        arrImages = arrImg
        if arrImg.count == 0{
            btnFinish.isHidden = true
        }else{
            btnFinish.isHidden = false
        }
        clsView.reloadData()
    }
}

extension StoreImageViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //MARK:- COLLECTION VIEW DELEGATES -
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreImageCollectionViewCell", for: indexPath) as! StoreImageCollectionViewCell
        if indexPath.row == 0{
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.addStoreTapped(_:)))
            cell.storeImage.isUserInteractionEnabled = true
            cell.storeImage.addGestureRecognizer(tapGestureRecognizer)
            cell.storeImage.image = UIImage(named: "addVideo.png")
        }
        else{
           cell.storeImage.image = arrImages[indexPath.row - 1]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (self.clsView.frame.width - 10) / 2, height: (self.clsView.frame.width - 10) / 2)
    }
}
