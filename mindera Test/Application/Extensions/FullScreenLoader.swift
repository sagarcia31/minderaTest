//
//  FullscreenLoader.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 27/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class FullScreenLoader: UIView {
    static let sharedInstance = FullScreenLoader()
    let viewName = "FullScreenLoader"
    
    @IBOutlet var contentView: UIView!
    
    /** View common init methods **/
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(viewName, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func show() {
        FullScreenLoader.sharedInstance.frame = UIApplication.shared.keyWindow!.frame
        UIApplication.shared.keyWindow?.addSubview(FullScreenLoader.sharedInstance)
    }
    
    func hide() {
        FullScreenLoader.sharedInstance.removeFromSuperview()
    }

}
