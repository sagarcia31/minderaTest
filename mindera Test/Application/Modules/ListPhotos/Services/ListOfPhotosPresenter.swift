//
//  ListOfPhotosPresenter.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class ListOfPhotosPresenter {
    weak var view: ListOfPhotosInterfaces?
    lazy var interactor: ListOfPhotosInteractorInput = {
        var interactor =  ListOfPhotosInteractor()
        interactor.output = self
        return interactor
    }()
    
    init(view: ListOfPhotosInterfaces) {
        self.view = view
    }
}


extension ListOfPhotosPresenter: ListOfPhotosInteractorOutput {
    func populatePhotoList(photoObject: PhotosObject) {
        view?.populatePhotoList(photoObject: photoObject)
    }
}

extension ListOfPhotosPresenter : ListOfPhotosModule {
    func getPhotoList() {
        interactor.getPhotoList()
    }
    
}
