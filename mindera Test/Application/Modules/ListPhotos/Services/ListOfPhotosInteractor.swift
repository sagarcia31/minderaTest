//
//  ListOfPhotosInteractor.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit
import SwiftyJSON

class ListOfPhotosInteractor {
    weak var output: ListOfPhotosInteractorOutput?
}

extension ListOfPhotosInteractor: ListOfPhotosInteractorInput{
    func getPhotoList() {
        getPhotos(){(photos) in
            self.output?.populatePhotoList(photoObject: photos)
        }
    }
    
    func getPhotos(completion: @escaping (PhotosObject) -> ()) {
        let apiURL = Environment().getUrlFrom(endPoint: EndpointPlistKey.imageList)
        
        BaseClient.sharedInstance.get(apiURL: apiURL, noConnection: handleErrorConnection, completion:  { response in
            guard  let data =  response.data else {
                return
            }
            
            guard  response.response?.statusCode == StatusCode.Success.rawValue  else{
                self.handleGenericError()
                return
            }
            
            let photoList = PhotosObject(json: JSON(data))
            
            return completion(photoList)
            
            
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
