//
//  Endpoint.swift
//  podium-iOS
//
//  Created by Fernando Frances on 01/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

internal enum Endpoint {
    case login (user: [String: String])
    case googleSignIn(token: String)
    case checkEmail(email: String)
    case checkAlias(alias: String)
    case tournaments (query: String)
    case users (query: String)
    case games
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
        request.setValue("\(parameters.count)", forHTTPHeaderField: "Content-Length")
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
        case .login:
            return .post
        case .googleSignIn:
            return .post
        case .checkEmail:
            return .post
        case .checkAlias:
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
        case .login:
            return "users/login"
        case .googleSignIn:
            return "users/google"
        case .checkEmail:
            return "users/checkEmail"
        case .checkAlias:
            return "users/checkAlias"
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
        case .login:
            return [:]
        case .googleSignIn(let token):
            return ["googleToken": token]
        case .checkEmail(let email):
            return ["email": email]
        case .checkAlias(let alias):
            return ["alias": alias]
        case .users(let query):
            return ["query": query]
        case .tournaments(let query):
            return ["query": query]
        case .games:
            return [:]
        }
    }
    
    var body: [String: String] {
        switch self {
        case .login(let user):
            return user
        case .googleSignIn:
            return [:]
        case .checkEmail:
            return [:]
        case .checkAlias:
            return [:]
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
        case .login:
            return ["Content-Type": "application/json"]
        case .googleSignIn:
            return [:]
        case .checkEmail:
            return [:]
        case .checkAlias:
            return [:]
        case .users:
            return [:]
        case .games:
            return [:]
        case .tournaments:
            return [:]
        }
    }
}
