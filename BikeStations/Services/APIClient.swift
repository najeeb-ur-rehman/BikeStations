//
//  APIClient.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation
import Combine

enum NetworkRequestError: LocalizedError, Equatable {
    case badRequest
    case invalidResponse
}


class APIClient {
    
    var baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func dispatch<T: Decodable>(_ request: HTTPRequest) -> AnyPublisher<T, Error> {
        guard let urlRequest = request.asURLRequest(baseURL: baseUrl) else {
            return Fail(outputType: T.self, failure: NetworkRequestError.badRequest).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .receive(on: RunLoop.main)
            .tryMap({ data, response in
                guard let response = response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode) else {
                          throw NetworkRequestError.invalidResponse
                }
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

