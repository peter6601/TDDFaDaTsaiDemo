//
//  NetworkingService.swift
//  TDDFaDaTsaiDemo
//
//  Created by Steve Sun on 2019-08-21.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

/// Representing a Requests protocol
protocol Requests {
    var url: URL { get }
}

/// Representing a Service protocol
protocol Service {
    func get(request: Requests, completion: @escaping (Result<Data, Error>) -> Void)
}

/// Networking Service
final class NetworkingService: Service {

    /// Get request
    ///
    /// parameter: Takes a `Requests` object
    /// completion: `Result` of data or errors
    func get(request: Requests, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: request.url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(ServiceError.invalidData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

/// Client service error
enum ServiceError: Error {
    case invalidData
}
