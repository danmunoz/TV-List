//
//  Episode.swift
//  TV List
//
//  Created by Daniel Munoz on 2/28/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation

struct Episode: Decodable {
    let id: Int
    let url: String?
    let name: String?
    let season: Int
    let number: Int
    let airDate: String?
    let airTime: String?
    let airStamp: String?
    let runtime: Int
    let image: Image?
    let summary: String?
    let show: Show?
}
