//
//  PhotoCell.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 26/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UITableViewCell {
    @IBOutlet weak var imageViewLeft: UIImageView!
    @IBOutlet weak var imageViewRight: UIImageView!
    
    static let identifier = "PhotoCell"
    lazy var presenter: PhotoCellPresenter = {
        return PhotoCellPresenter(view: self)
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateImageCell(id:String){
        presenter.requestImage(id: id)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PhotoCell: PhotoCellInterfaces {
    func populateImageCell(photo: PhotoImage) {
        imageViewLeft.sd_setImage(with: URL(string:photo.source!), placeholderImage: UIImage(named: "placeholder.png"))
        imageViewRight.sd_setImage(with: URL(string:photo.source!), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
