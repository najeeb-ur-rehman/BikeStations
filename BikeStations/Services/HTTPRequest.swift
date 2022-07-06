//
//  HTTPRequest.swift
//  BikeStations
//
//  Created by Najeeb on 06/07/2022.
//

import Foundation

protocol HTTPRequest {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension HTTPRequest {
    var method: HTTPMethod { .get }
    var parameters: [String: Any]? { nil }
    var headers: [String: String]? { nil }
}

extension HTTPRequest {
    
    private func requestBodyFrom(params: [String: Any]?) -> Data? {
        guard let params = params else { return nil }
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return nil
        }
        return httpBody
    }
    
    func asURLRequest(baseURL: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: baseURL) else { return nil }
        urlComponents.path = "\(urlComponents.path)\(path)"
        guard let finalURL = urlComponents.url else { return nil }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.httpBody = requestBodyFrom(params: parameters)
        request.allHTTPHeaderFields = headers
        return request
    }
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
