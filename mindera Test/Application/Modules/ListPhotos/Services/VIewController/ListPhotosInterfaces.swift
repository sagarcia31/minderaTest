//
//  ListPhotosInterfaces.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

protocol ListOfPhotosInterfaces: class {
    func populatePhotoList(photoObject:PhotosObject)
    func showError(error:String)
    func showLoader()
    func hideLoader()
}

protocol ListOfPhotosInteractorInput {
    func getPhotoList(page:Int)
}

protocol ListOfPhotosInteractorOutput: class {
    func populatePhotoList(photoObject:PhotosObject)
    func showError(error:String)
}

protocol ListOfPhotosModule {
    func getPhotoList(page:Int)
}
