//
//  Show.swift
//  TV List
//
//  Created by Daniel Munoz on 2/28/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm
import ObjectMapperAdditions

//MARK: - Show Class
class Show: Object, Mappable{
    @objc dynamic var id: Int = 0
    @objc dynamic var urlString: String?
    @objc dynamic var name: String?
    @objc dynamic var type: String?
    @objc dynamic var language: String?
    var genres: List<String> = List<String>()
    @objc dynamic var status: String?
    @objc dynamic var runtime: Int = 0
    @objc dynamic var premiered: Date?
    @objc dynamic var officialSite: String?
    @objc dynamic var schedule: ShowSchedule?
    @objc dynamic var ratingAverage: Int = 0
    @objc dynamic var weight: Int = 0
    @objc dynamic var network: Network?
    @objc dynamic var webChannel: String?
    @objc dynamic var externals: ShowExternals?
    @objc dynamic var image: ShowImage?
    @objc dynamic var summary: String?
    @objc dynamic var updated: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        urlString <- map["url"]
        name <- map["name"]
        type <- map["type"]
        language <- map["language"]
        genres <- (map["genres"], RealmTypeCastTransform())
        status <- map["status"]
        runtime <- map["runtime"]
        let transform = TransformOf<Date, String>(fromJSON: { (value: String?) -> Date? in
            if let value = value {
                return Date.fromString(dateString: value, format: "yyyy-mm-dd")
            }
            return nil
        }, toJSON: { (value: Date?) -> String? in
            if let value = value {
                return value.getString(format: "yyyy-mm-dd")
            }
            return nil
        })
        premiered <- (map["premiered"], transform)//
        officialSite <- map["officialSite"]
        schedule <- map["schedule"]
        ratingAverage <- map["rating.average"]
        weight <- map["weight"]
        network <- map["network"]
        webChannel <- map["webChannel"]
        externals <- map["externals"]
        image <- map["image"]
        summary <- map["summary"]
        updated <- map["updated"]
    }
}

//MARK: - ShowSchedule Class
class ShowSchedule: Object, Mappable{
    @objc dynamic var time: String?
    var days: List<String> = List<String>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        time <- map["time"]
        days <- (map["days"], RealmTypeCastTransform())
    }
}

//MARK: - ShowExternals Class
class ShowExternals: Object, Mappable{
    @objc dynamic var tvrage: Int = 0
    @objc dynamic var thetvdb: Int = 0
    @objc dynamic var imdb: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        tvrage <- map["tvrage"]
        thetvdb <- map["thetvdb"]
        imdb <- map["imdb"]
    }
}

//MARK: - ShowImage Class
class ShowImage: Object, Mappable{
    @objc dynamic var medium: String?
    @objc dynamic var original: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        medium <- map["medium"]
        original <- map["original"]
    }
}
