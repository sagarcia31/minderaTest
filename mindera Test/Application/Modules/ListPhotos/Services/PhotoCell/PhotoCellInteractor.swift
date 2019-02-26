//
//  PhotoCellInteractor.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 26/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit
import SwiftyJSON

class PhotoCellInteractor {
    weak var output: PhotoCellInteractorOutput?
}

extension PhotoCellInteractor: PhotoCellInteractorInput {
    func requestImage(id: String) {
        getPhotos(){(photoImage) in
            self.output?.populateImageCell(photo: photoImage)
        }
    }
    
    func getPhotos(completion: @escaping (PhotoImage) -> ()) {
        let apiURL = Environment().getUrlFrom(endPoint: EndpointPlistKey.getImage)
        
        BaseClient.sharedInstance.get(apiURL: apiURL, noConnection: handleErrorConnection, completion:  { response in
            guard  let data =  response.data else {
                return
            }
            
            guard  response.response?.statusCode == StatusCode.Success.rawValue  else{
                self.handleGenericError()
                return
            }
            
            let photoImage = PhotoImage(json: JSON(data))
            
            return completion(photoImage)
            
        })
    }
    
    
    //MARK: ERROR
    func handleErrorConnection() {
        print("Error Connection")
    }
    
    func handleGenericError() {
        print("Generic Error")
    }
}
