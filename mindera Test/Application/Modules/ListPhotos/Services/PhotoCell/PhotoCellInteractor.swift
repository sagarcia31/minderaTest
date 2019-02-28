//
//  PhotoCellInteractor.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 26/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit

class PhotoCellInteractor {
    weak var output: PhotoCellInteractorOutput?
    static let attributeLabel = "Large Square"
}

extension PhotoCellInteractor: PhotoCellInteractorInput {
    func requestImage(id: String) {
        getPhotos(id: id){(photoImage) in
            self.output?.populateImageCell(photo: photoImage)
        }
    }
    
    func getPhotos(id:String, completion: @escaping (PhotoImage) -> ()) {
        let apiURL = Environment().getUrlFrom(endPoint: EndpointPlistKey.getImage, parameters: ["&photo_id=\(id)"])
        
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
                let photoImage = try decoder.decode(PhotoImageDictionary.self, from: data)
                
                let filteredImage = photoImage.sizes.listSize.filter() { $0.label ==  PhotoCellInteractor.attributeLabel}
                
                return completion(filteredImage[0])

            } catch {
                self.handleGenericError()
            }

        })
    }
    
    
    //MARK: ERROR
    func handleErrorConnection() {
        output?.handleErrorRequest()
    }
    
    func handleGenericError() {
        output?.handleErrorRequest()
    }
}
