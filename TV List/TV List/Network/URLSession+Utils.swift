//
//  URLSession+Utils.swift
//  TV List
//
//  Created by Daniel Munoz on 02.05.20.
//  Copyright © 2020 Daniel Munoz. All rights reserved.
//

import Foundation

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Swift.Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }

            guard
                let response = response,
                let data = data
                else {
                    let error = NSError(domain: "error", code: 0, userInfo: nil)
                    result(.failure(error))
                    return
            }
            result(.success((response, data)))
        }
    }
}

extension URLSession {
    typealias Handler = (Swift.Result<Data, NetworkError>) -> Void

    @discardableResult
    func request(endpoint: Endpoint, then handler: @escaping Handler) -> URLSessionDataTask {
        let task = self.dataTask(with: endpoint.url) { (data, response, error) in
            if let error = error {
                handler(.failure(.generic(description: error.localizedDescription)))
                return
            }
            if response == nil {
                handler(.failure(.noResponse))
                return
            }
            guard  let data = data else {
                handler(.failure(.noData))
                return
            }
            handler(.success(data))
        }
        task.resume()
        return task
    }
}
