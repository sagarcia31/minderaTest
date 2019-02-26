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
}

protocol ListOfPhotosInteractorInput {
    func getPhotoList()
}

protocol ListOfPhotosInteractorOutput: class {
    func populatePhotoList(photoObject:PhotosObject)
}

protocol ListOfPhotosModule {
    func getPhotoList()
}
