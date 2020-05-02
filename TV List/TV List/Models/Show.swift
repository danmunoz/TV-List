//
//  Show.swift
//  TV List
//
//  Created by Daniel Munoz on 2/28/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation

struct Country: Decodable {
    let name: String
    let code: String
    let timezone: String
}

struct Image: Decodable {
    let medium: String
    let original: String
}

struct Show: Decodable {
    let id: Int
    let urlString: String?
    let name: String?
    let type: String?
    let language: String?
    var genres: [String]?
    let status: String?
    let runtime: Int
    let premiered: String?
    let officialSite: String?

    struct Schedule: Decodable {
        let time: String?
        let days: [String]?
    }
    let schedule: Schedule?

    struct Rating: Decodable {
        let average: Double?
    }
    let rating: Rating?
    let weight: Int?

    struct Network: Decodable {
        let id: Int
        let name: String?
        let country: Country
    }
    let network: Network?

    struct WebChannel: Decodable {
        let id: Int
        let name: String?
        let country: Country
    }

    struct Externals: Decodable {
        let tvrage: Int?
        let thetvdb: Int?
        let imdb: String?
    }
    let externals: Externals?
    let image: Image?
    let summary: String?
    let updated: Int
}
