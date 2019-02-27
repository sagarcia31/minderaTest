//
//  UIImageNameExtension.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 27/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

extension UIImage {
    
    enum AssetIdentifier: String {
        case placeholder
    }
    
    convenience init!(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}
