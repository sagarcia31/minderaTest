//
//  ListOfPhotosInteractor.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class ListOfPhotosInteractor {
    weak var output: ListOfPhotosInteractorOutput?
}

extension ListOfPhotosInteractor: ListOfPhotosInteractorInput{
    func getPhotoList(page: Int) {
        getPhotos(page:page){(photos) in
            self.output?.populatePhotoList(photoObject: photos)
        }
    }
    
    func getPhotos(page:Int,completion: @escaping (PhotosObject) -> ()) {
        let apiURL = Environment().getUrlFrom(endPoint: EndpointPlistKey.imageList, parameters: ["&page=\(page)"])
        
        BaseClient.sharedInstance.get(apiURL: apiURL, noConnection: handleErrorConnection, completion:  { response in
            guard  let data =  response.data else {
                return
            }
            
            guard  response.response?.statusCode == StatusCode.Success.rawValue  else{
                self.handleGenericError()
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photoList = try decoder.decode(PhotoDictionary.self, from: data)
                return completion(photoList.photos)
            } catch {
                self.handleGenericError()
            }
            
        })
    }
    
    
    //MARK: ERROR
    func handleErrorConnection() {
        output?.showError(error: "Error Connection")
    }
    
    func handleGenericError() {
        output?.showError(error: "Generic Error")
    }
    
}
