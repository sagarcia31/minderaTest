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
    func getPhotoList() {
        
    }
    
    func getPhotos(completion: @escaping ([Any]) -> ()) {
        let apiURL = Environment().getUrlFrom(endPoint: EndpointPlistKey.imageList)
        
        BaseClient.sharedInstance.get(apiURL: apiURL, noConnection: handleErrorConnection, completion:  { [unowned self] response in
            self.handleGetRequest(response: response, completion: completion)
        })
    }
    
    
    //MARK: ERROR
    func handleErrorConnection() {
        print("Error Connection")
        return
    }
    
}
