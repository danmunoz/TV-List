//
//  Endpoint.swift
//  TV List
//
//  Created by Daniel Munoz on 02.05.20.
//  Copyright © 2020 Daniel Munoz. All rights reserved.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.tvmaze.com"
        components.path = "/" + self.path
        components.queryItems = self.queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}

extension Endpoint {
    static var schedule: Self {
        Endpoint(path: "schedule")
    }

    static func show(showId id: String) -> Self {
        Endpoint(path: "shows/\(id)")
    }

    static func episode(episodeId id: String) -> Self {
        Endpoint(path: "episodes/\(id)")
    }
}
