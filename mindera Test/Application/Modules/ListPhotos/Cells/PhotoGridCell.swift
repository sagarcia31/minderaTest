//
//  PhotoGridCell.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 26/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class PhotoGridCell: UICollectionViewCell {
    static let identifier = "PhotoGridCell"
    lazy var presenter: PhotoCellPresenter = {
        return PhotoCellPresenter(view: self)
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populateImageCell(id:String){
        presenter.requestImage(id: id)
    }

}

extension PhotoGridCell: PhotoCellInterfaces {
    func populateImageCell(photo: PhotoImage) {
//        imageView.sd_setImage(with: URL(string:photo.source!), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
