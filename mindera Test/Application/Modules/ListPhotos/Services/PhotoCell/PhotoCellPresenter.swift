//
//  PhotoCellPresenter.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 26/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class PhotoCellPresenter {
    weak var view: PhotoCellInterfaces?
    lazy var interactor: PhotoCellInteractorInput = {
        var interactor =  PhotoCellInteractor()
        interactor.output = self
        return interactor
    }()
    
    init(view: PhotoCellInterfaces) {
        self.view = view
    }
}


extension PhotoCellPresenter: PhotoCellInteractorOutput {
    func handleErrorRequest() {
        view?.handleErrorRequest()
    }
    
    func populateImageCell(photo: PhotoImage) {
        view?.populateImageCell(photo: photo)
    }
}

extension PhotoCellPresenter : PhotoCellModule {
    func requestImage(id: String) {
        interactor.requestImage(id: id)
    }
}
