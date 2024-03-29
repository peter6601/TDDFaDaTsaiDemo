//
//  FaDaTsaiAPI.swift
//  TDDFaDaTsaiDemo
//
//  Created by Steve Sun on 2019-08-21.
//  Copyright © 2019 DinDin. All rights reserved.
//

import Foundation

/// Representing an API requests object
enum APIRequests: String, Requests {
    /// Request's URL in string
    case request = "https://gist.githubusercontent.com/SteveS0911/ade1c7d1033cf74446b8200e1ffd7da3/raw/b366f21d0fcf2af667338c83cdbdf91686ec91b9/FaDaTsaiAPP.json"

    /// Request's URL
    var url: URL {
        return URL(string: rawValue)!
    }
}

protocol FaDaTsaiAPIProtocol {
    var service: Service { get }
    func getResult(request: Requests, completion: @escaping (Result<FaDaTsaiResult, Error>) -> Void) -> URLSessionTask?
}

/// Representing an FaDaTsai API object
final class FaDaTsaiAPI: FaDaTsaiAPIProtocol {

    /// `FaDaTsaiAPI` service
    let service: Service

    /// Initialize an `FaDaTsaiAPI` object
    init(service: Service = NetworkingService()) {
        self.service = service
    }

    /// Retrieve `FaDaTsaiResult` from `Requests` object
    ///
    /// - Parameter request: Takes a `Requests` object to retrieve its request
    /// - Parameter completion: `Result` of `FaDaTsaiResult` or errors
    /// 
    /// - Returns: `URLSessionTask`
    func getResult(request: Requests = APIRequests.request, completion: @escaping (Result<FaDaTsaiResult, Error>) -> Void) -> URLSessionTask? {
        return service.get(request: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let faDaTsai: FaDaTsaiResult = try JSONDecoder().decode(FaDaTsaiResult.self, from: data)

                        completion(.success(faDaTsai))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

/// API error
enum APIError: Error {
    case noResult
}
