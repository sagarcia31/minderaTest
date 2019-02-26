//
//  ViewController.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var presenter: ListOfPhotosPresenter = {
        return ListOfPhotosPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getPhotoList()
    }


}

extension ViewController: ListOfPhotosInterfaces{
    func populatePhotoList(photoObject: PhotosObject) {
        print(photoObject)
    }
}
