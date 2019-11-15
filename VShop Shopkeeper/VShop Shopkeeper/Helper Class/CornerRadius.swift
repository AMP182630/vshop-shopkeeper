//
//  CornerRadius.swift
//  GlamBot
//
//  Created by Parth Patel on 08/07/19.
//  Copyright © 2019 Parth Patel. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
@IBDesignable
class DesignableUITextField: UITextField {
     @IBInspectable var leftPadding: CGFloat = 0

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        super.textRect(forBounds: bounds)
        var rect = CGRect(x: bounds.origin.x+leadingSpace, y: bounds.origin.y, width: bounds.size.width-abs(leadingSpace+trailingSpace), height: bounds.size.height)
        if rightView != nil {
            rect = CGRect(x: bounds.origin.x+leadingSpace, y: bounds.origin.y, width: bounds.size.width-abs(leadingSpace+trailingSpace+(rightView?.frame.width)!), height: bounds.size.height)
        }
        return rect
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds:bounds)
    }

    private var leadingSpace: CGFloat = 0.0
    @IBInspectable var leadingGap: CGFloat = 0.0 {
        // Update your UI when value changes
        didSet {
            leadingSpace = leadingGap
        }
    }

    private var trailingSpace: CGFloat = 0.0
    @IBInspectable var trailingGap: CGFloat = 0.0 {
        // Update your UI when value changes
        didSet {
            trailingSpace = trailingGap
        }
    }
}
class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
