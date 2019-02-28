//
//  PhotoCellInterfaces.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 26/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

protocol PhotoCellInterfaces: class {
    func populateImageCell(photo:PhotoImage)
    func handleErrorRequest()
}

protocol PhotoCellInteractorInput {
    func requestImage(id:String)
}

protocol PhotoCellInteractorOutput: class {
     func populateImageCell(photo:PhotoImage)
     func handleErrorRequest()
}

protocol PhotoCellModule {
    func requestImage(id:String)
}
