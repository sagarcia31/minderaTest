//
//  PlistConfiguration.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 24/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import Foundation

public enum PlistKey {
    case ApiURl
    case ApiKey
    
    func value() -> String {
        switch self {
        case .ApiURl:
            return "API_URL"
        case .ApiKey:
            return "API_KEY"
        }
    }
}

public enum EndpointPlistKey {
    case imageList
    
    func value() -> String {
        switch self {
        case .imageList:
            return "list images"
        }
    }
}

public struct Environment {
    
    fileprivate var infoDict: [String: Any]  {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            }else {
                fatalError("Plist file not found")
            }
        }
    }
    
    fileprivate var endPointDict: NSDictionary {
        get {
            var dict: NSDictionary?
            if let path = Bundle.main.path(forResource: "Endpoints", ofType: "plist") {
                dict = NSDictionary(contentsOfFile: path)
                return dict!
            } else {
                fatalError("Plist file not found")
            }
        }
    }
    
    public func getUrlFrom(endPoint: EndpointPlistKey,page:Int? = 0, parameters:[String]=[""]) -> String {
        guard let baseUrl = infoDict[PlistKey.ApiURl.value()] as? String else {
            return ""
        }
        
        guard let apiKey = infoDict[PlistKey.ApiKey.value()] as? String else {
            return ""
        }
        
        guard let endPoint = endPointDict[endPoint.value()] as? String else {
            return ""
        }
        
        let url = baseUrl + endPoint + "&api_key=\(apiKey)&tags=kitten&page=\(String(describing: page))&format=json&nojsoncallback=1"
        
        guard parameters.count > 0 else {
            return  url
        }
        
        var returnUrl = url
        for item in parameters {
            returnUrl +=  item
        }
        
        return returnUrl
    }
}
