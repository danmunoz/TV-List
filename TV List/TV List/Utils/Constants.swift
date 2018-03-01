//
//  Constants.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation

struct Constants {
    struct API {
        static func Show(showId: String) -> String {
            return "http://api.tvmaze.com/shows/\(showId)"
        }
        static func Episode(episodeId: String) -> String {
            return "http://api.tvmaze.com/episodes/\(episodeId)"
        }
    }
}
