//
//  Network.swift
//  TV List
//
//  Created by Daniel Munoz on 2/28/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

//MARK: - Network Class
class Network: Object, Mappable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var country: Country?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        country <- map["country"]
    }
}

//MARK: - Country Class
class Country: Object, Mappable {
    @objc dynamic var name: String?
    @objc dynamic var code: String?
    @objc dynamic var timezone: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        code <- map["code"]
        timezone <- map["timezone"]
    }
}
