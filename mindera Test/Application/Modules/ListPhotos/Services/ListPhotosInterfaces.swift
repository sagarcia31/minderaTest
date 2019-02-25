//
//  ListPhotosInterfaces.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

protocol ListOfPhotosInterfaces: class {
    func populatePhotoList()
}

protocol ListOfPhotosInteractorInput {
    func getPhotoList()
}

protocol ListOfPhotosInteractorOutput: class {
    func populatePhotoList()
}

protocol ListOfPhotosModule {
    func getPhotoList()
}
