//
//  UIVIewControllerExtension.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 27/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
