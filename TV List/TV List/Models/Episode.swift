//
//  Episode.swift
//  TV List
//
//  Created by Daniel Munoz on 2/28/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class Episode: Object, Mappable{
    @objc dynamic var id: Int = 0
    @objc dynamic var url: String?
    @objc dynamic var name: String?
    @objc dynamic var season: Int = 0
    @objc dynamic var number: Int = 0
    @objc dynamic var airDate: String?
    @objc dynamic var airTime: String?
    @objc dynamic var airStamp: Date?
    @objc dynamic var runtime: Int = 0
    @objc dynamic var image: String?
    @objc dynamic var summary: String?
    @objc dynamic var show: Show?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        url <- map["url"]
        name <- map["name"]
        season <- map["season"]
        number <- map["number"]
        airDate <- map["airdate"]
        airTime <- map["airtime"]
        let transform = TransformOf<Date, String>(fromJSON: { (value: String?) -> Date? in
            if let value = value {
                return Date.fromString(dateString: value, format: "yyyy-MM-dd'T'HH:mm:ssZ")
            }
            return nil
        }, toJSON: { (value: Date?) -> String? in
            if let value = value {
                return value.getString(format: "yyyy-MM-dd'T'HH:mm:ssZ")
            }
            return nil
        })
        airStamp <- (map["airstamp"], transform)
        runtime <- map["runtime"]
        image <- map["image"]
        summary <- map["summary"]
        show <- map["show"]
    }
}
