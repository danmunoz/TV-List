//
//  APIManager.swift
//  TV List
//
//  Created by Daniel Munoz on 3/1/18.
//  Copyright © 2018 Daniel Munoz. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case generic(description: String)
    case noResponse
    case noData
    case invalidData
}

class APIManager {
    static func getSchedule(session: URLSession = .shared, completionHandler: @escaping (Swift.Result<[Episode], NetworkError>) -> Void)  {
        session.request(endpoint: .schedule) { result in
            switch result {
            case .success(let data):
                let episodes: [Episode]? = try? JSONDecoder().decode([Episode].self, from: data)
                completionHandler(.success(episodes ?? [Episode]()))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }

    static func getShow(showId id: String, session: URLSession = .shared, completionHandler: @escaping (Swift.Result<Show, NetworkError>) -> Void) {
        session.request(endpoint: .show(showId: id)) { result in
            switch result {
            case .success(let data):
                guard let show = try? JSONDecoder().decode(Show.self, from: data) else {
                    completionHandler(.failure(.invalidData))
                    return
                }
                completionHandler(.success(show))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }

    static func getEpisode(episodeId id: String, session: URLSession = .shared, completionHandler: @escaping (Swift.Result<Episode, NetworkError>) -> Void) {
        session.request(endpoint: .episode(episodeId: id)) { result in
            switch result {
            case .success(let data):
                guard let episode = try? JSONDecoder().decode(Episode.self, from: data) else {
                    completionHandler(.failure(.invalidData))
                    return
                }
                completionHandler(.success(episode))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }

}
