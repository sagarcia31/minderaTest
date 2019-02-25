//
//  BaseClient.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//
import Foundation
import Alamofire
class  BaseClient {
    static let sharedInstance = BaseClient()
    var headers: [String : String]!
    
    func get(apiURL: String,  noConnection: () -> (), completion: @escaping (DefaultDataResponse) -> ()) {
        if !NetworkReachabilityManager()!.isReachable {
            noConnection()
            return
        }
        
        Alamofire.request(apiURL, method: .get, encoding: JSONEncoding.default, headers: headers).response {(response) in
            completion(response)
        }
    }
}
