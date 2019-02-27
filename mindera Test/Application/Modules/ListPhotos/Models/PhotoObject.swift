//
//  PhotoObject.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 25/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Photo:Decodable {
    var id:String?
    var owner:String?
    var secret:String?
    var server:String?
    var farm:Int
    var title:String
    var isPublic:Int
    var isFriend:Int
    var isFamily:Int
    
    enum CodingKeys: String, CodingKey {
        case
        id          = "id",
        owner       = "owner",
        server      = "server",
        farm        = "farm",
        title       = "title",
        isPublic    = "ispublic",
        isFriend    = "isfriend",
        isFamily    = "isfamily"
    }
}

struct PhotosObject:Decodable {
    var total:String?
    var page:Int
    var photo:[Photo] = []
    
    enum CodingKeys: String, CodingKey {
            case
            total       = "total",
            page        = "page",
            photo       = "photo"
    }
}

struct PhotoDictionary:Decodable {
    var photos:PhotosObject
}

struct PhotoImage:Decodable {
    var label:String?
    var source:String?
    var url:String?
    var media:String?
    
    enum CodingKeys: String, CodingKey {
        case
        label       = "label",
        source      = "source",
        url         = "url",
        media       = "media"
    }
    
}

struct PhotoImageList:Decodable {
    var canblog:Int
    var canprint:Int
    var candownload:Int
    var listSize:[PhotoImage]
    
    enum CodingKeys: String, CodingKey {
        case
        listSize       = "size",
        canblog        = "canblog",
        canprint       = "canprint",
        candownload    = "candownload"
    }
}

struct PhotoImageDictionary:Decodable {
    var sizes:PhotoImageList
}
