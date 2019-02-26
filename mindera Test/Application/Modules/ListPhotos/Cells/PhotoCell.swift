//
//  PhotoCell.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 26/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    static let identifier = "PhotoCell"
    
    lazy var presenter: PhotoCellPresenter = {
        return PhotoCellPresenter(view: self)
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        presenter.requestImage(id: "121212")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PhotoCell: PhotoCellInterfaces {
    func populateImageCell(photo: PhotoImage) {
        print(photo.url)
    }
}
