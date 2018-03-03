//
//  Endpoint.swift
//  podium-iOS
//
//  Created by Fernando Frances on 01/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

internal enum Endpoint {
    case configuration
    case tournaments(query: String)
    case users(query: String)
    case games(query: String)
    case user(identifier: String)
    case tournament(identifier: String)
    case game(identifier: String)
}

internal extension Endpoint {
    func request(with baseURL: URL, adding parameters: [String: String])-> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var newParameters = self.parameters
        parameters.forEach { newParameters.updateValue($1, forKey: $0)}
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = newParameters.map(URLQueryItem.init)
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        return request
    }
}

private enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

private extension Endpoint {
    var method: HTTPMethod {
        switch self {
        case .configuration:
            return .get
        case .users:
            return .get
        case .tournaments:
            return .get
        case .games:
            return .get
        case .tournament:
            return .get
        case .user:
            return .get
        case .game:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .configuration:
            return "configuration"
        case .users:
            return "users"
        case .tournaments:
            return "tournaments"
        case .games:
            return "games"
        case .tournament(let identifier):
            return "tournaments/\(identifier)"
        case .user(let identifier):
            return "users/\(identifier)"
        case .game(let identifier):
            return "games/\(identifier)"
        }
    }
    
    var parameters: [String:String] {
        switch self {
        case .configuration:
            return [:]
        case .users(let query):
            return ["query": query]
        case .tournaments(let query):
            return ["query": query]
        case .games(let query):
            return ["query": query]
        case .tournament:
            return [:]
        case .user:
            return [:]
        case .game:
            return [:]
        }
    }
}
