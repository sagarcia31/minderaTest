//
//  PhotoGridCell.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 26/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit
import AlamofireImage

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
        imageView.image = UIImage(assetIdentifier: .placeholder)
        presenter.requestImage(id: id)
    }

}

extension PhotoGridCell: PhotoCellInterfaces {
    func populateImageCell(photo: PhotoImage) {
        guard let url = photo.source else {return}
        let urlSource = URL(string: url)
        imageView.af_setImage(withURL: urlSource!)
    }
}
