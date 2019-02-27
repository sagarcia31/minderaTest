//
//  UIVIewExtensions.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 27/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

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
