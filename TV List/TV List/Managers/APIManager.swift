//
//  APIManager.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

enum NetworkError: Error {
    case badURL
}

class APIManager {

    static func getShow(showId: String, success:@escaping (_ show: Show?)->(), failure:@escaping (_ error: Error?)->()) {
        Alamofire.request(Constants.API.Show(showId: showId)).responseObject { (response: DataResponse<Show>) in
            if let error = response.error {
                failure(error)
            }
            else {
                success(response.result.value)
            }
        }
    }
    
    static func getEpisode(episodeId: String, success:@escaping (_ episode: Episode?)->(), failure:@escaping (_ error: Error?)->()) {
        Alamofire.request(Constants.API.Episode(episodeId: episodeId)).responseObject { (response: DataResponse<Episode>) in
            if let error = response.error {
                failure(error)
            }
            else {
                success(response.result.value)
            }
        }
    }
    
    static func getSchedule(success:@escaping (_ episode: [Episode]?)->(), failure:@escaping (_ error: Error?)->()) {
        Alamofire.request(Constants.API.Schedule).responseArray { (response: DataResponse<[Episode]>) in
            if let error = response.error {
                failure(error)
            }
            else {
                success(response.result.value)
            }
        }
    }
}
