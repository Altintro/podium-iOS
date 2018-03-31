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
    case googleConnect(token: String)
    case emailConnect(email: String)
    case emailRegister(user: [String: String])
    case me
    case checkAlias(alias: String)
    case tournaments
    case users
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
        if(request.httpMethod != "GET"){
             request.httpBody = body
        }
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
        case .googleConnect:
            return .post
        case .emailConnect:
            return .post
        case .emailRegister:
            return .post
        case .me:
            return .get
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
        case .googleConnect:
            return "users/googleConnect"
        case .emailConnect:
            return "users/emailConnect"
        case .emailRegister:
            return "users/emailRegister"
        case .me:
            return "users/me"
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
        case .googleConnect(let token):
            return ["googleToken": token]
        case .emailConnect(let email):
            return ["email": email]
        case .emailRegister:
            return [:]
         case .me:
            return [:]
        case .checkAlias(let alias):
            return ["alias": alias]
        case .users:
            return [:]
        case .tournaments:
            return [:]
        case .games:
            return [:]
        }
    }
    
    var body: [String: String] {
        switch self {
        case .login(let user):
            return user
        case .googleConnect:
            return [:]
        case .emailConnect:
            return [:]
        case .emailRegister(let user):
            return user
        case .me:
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
        case .googleConnect:
            return [:]
        case .emailConnect:
            return [:]
        case .emailRegister:
            return ["Content-Type": "application/json"]
        case .me:
            return ["x-access-token": UserDefaults.standard.string(forKey: "x-access-token") ?? ""]
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
