//
//  Endpoint.swift
//  podium-iOS
//
//  Created by Fernando Frances on 01/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

internal enum Endpoint {
    case register (user: [String: String])
    case login (user: [String: String])
    case tournaments (query: String)
    case users (query: String)
    case games (query: String)
}

internal extension Endpoint {
    func request(with baseURL: URL)-> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = parameters.map(URLQueryItem.init)
        
        let body = try! JSONSerialization.data(withJSONObject: self.body,
                                          options: .prettyPrinted)
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        request.httpBody = body
        headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
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
        case .register:
            return .post
        case .login:
            return .post
        case .users:
            return .get
        case .tournaments:
            return .get
        case .games:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .register:
            return "users/register"
        case .login:
            return "users/login"
        case .users:
            return "users"
        case .tournaments:
            return "tournaments"
        case .games:
            return "games"
        }
    }
    
    var parameters: [String:String] {
        switch self {
        case .register:
            return [:]
        case .login:
            return [:]
        case .users(let query):
            return ["query": query]
        case .tournaments(let query):
            return ["query": query]
        case .games(let query):
            return ["query": query]
        }
    }
    
    var body: [String: String] {
        switch self {
        case .register(let user):
            return user
        case .login(let user):
            return user
        case .users:
            return [:]
        case .games:
            return [:]
        case .tournaments:
            return [:]
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .register:
            return ["Content-Type": "application/json"]
        case .login:
            return ["Content-Type": "application/json"]
        case .users:
            return [:]
        case .games:
            return [:]
        case .tournaments:
            return [:]
        }
    }
}
