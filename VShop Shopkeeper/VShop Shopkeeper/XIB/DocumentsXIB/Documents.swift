//
//  DocumentsView.swift
//  VShopRomingStaff
//
//  Created by Neel Purohit on 24/10/19.
//  Copyright © 2019 Neel Purohit. All rights reserved.
//

import UIKit

class Documents: UIView {
    @IBOutlet var documentNumberLabel: UILabel!
    @IBOutlet var documentDetailsLabel: UILabel!
    @IBOutlet var frontOfDocumentView: UIView!
    @IBOutlet var backOfDocumentView: UIView!
    @IBOutlet var documentNumberTextField: UITextField!
    @IBOutlet var frontOfDocumentImage: UIImageView!
    @IBOutlet var backOfDocumentImage: UIImageView!
    @IBOutlet weak var frontButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
}
