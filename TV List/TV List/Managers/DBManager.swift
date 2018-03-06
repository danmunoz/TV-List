//
//  DBManager.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    static func saveShow(show: Show) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(show)
        }
    }
    
    static func getShows() -> Results<Show> {
        let realm = try! Realm()
        return realm.objects(Show.self)
    }
    
    static func saveEpisode(episode: Episode) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(episode)
        }
    }
}
