//
//  Rounded View.swift
//  Bubbles
//
//  Created by Warren Hansen on 6/18/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
