//
//  PhotoObject.swift
//  mindera Test
//
//  Created by Marcelo Garcia on 25/02/19.
//  Copyright © 2019 Marcelo Garcia. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Photo {
    var id:String?
    var owner:String?
    var secret:String?
    var server:String?
    var farm:Int
    var title:String
    var isPublic:Bool
    var isFriend:Bool
    var isFamily:Bool
    
    init(json: JSON) {
        self.id         = json["id"].stringValue
        self.owner      = json["owner"].stringValue
        self.secret     = json["secret"].stringValue
        self.server     = json["server"].stringValue
        self.farm       = json["farm"].intValue
        self.title      = json["title"].stringValue
        self.isPublic   = json["isPublic"].boolValue
        self.isFriend   = json["isFriend"].boolValue
        self.isFamily   = json["isFamily"].boolValue
    }
}

struct PhotosObject {
    var total:String?
    var page:Int
    var photo:[JSON]
    var listPhotos:[Photo] = []
    init(json:JSON){
        self.total      = json["photos"]["total"].stringValue
        self.page       = json["photos"]["page"].intValue
        self.photo      = json["photos"]["photo"].arrayValue
        
        for item in photo{
            let objectPhoto = Photo(json: item)
            self.listPhotos.append(objectPhoto)
        }
    }
}

struct PhotoImage {
    var label:String?
    var width:String?
    var height:String?
    var source:String?
    var url:String?
    var media:String?
    
    init(json:JSON) {
        self.label      = json["label"].stringValue
        self.width      = json["width"].stringValue
        self.height     = json["height"].stringValue
        self.source     = json["source"].stringValue
        self.url        = json["url"].stringValue
        self.media      = json["media"].stringValue
    }
}
