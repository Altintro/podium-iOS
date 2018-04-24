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
    case facebookConnect(token: String)
    case emailConnect(email: String)
    case emailRegister(data: [String: String])
    case socialRegister(data: [String: String])
    case tokens
    case refreshToken
    case checkAlias(alias: String)
    case featuredTournaments
    case featuredGames
    case sports
    case users
    case game(id: String)
    case joinGame(id: String)
    case createGame(data: [String: String])
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
        if request.httpMethod != "GET" {
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
        case .facebookConnect:
            return .post
        case .emailConnect:
            return .post
        case .emailRegister:
            return .post
        case .socialRegister:
            return .post
        case .tokens:
            return .get
        case .refreshToken:
            return .post
        case .checkAlias:
            return .post
        case .featuredTournaments:
            return .get
        case .featuredGames:
            return .get
        case .sports:
            return .get
        case .users:
            return .get
        case .game:
            return .get
        case .joinGame:
            return .post
        case .createGame:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "users/login"
        case .googleConnect:
            return "users/googleConnect"
        case .facebookConnect:
            return "users/facebookConnect"
        case .emailConnect:
            return "users/emailConnect"
        case .emailRegister:
            return "users/emailRegister"
        case .socialRegister:
            return "users/socialRegister"
        case .tokens:
            return "users/tokens"
        case .refreshToken:
            return "users/refreshToken"
        case .checkAlias:
            return "users/checkAlias"
        case .featuredTournaments:
            return "tournaments"
        case .featuredGames:
            return "games"
        case .sports:
            return "sports"
        case .users:
            return "users"
        case .game(let id):
            return "game/\(id)/detail"
        case .joinGame(let id):
            return "game/\(id)/join"
        case .createGame:
            return "games"
        }
    }
    
    var parameters: [String:String] {
        switch self {
        case .login:
            return [:]
        case .googleConnect(let token):
            return ["googleToken": token]
        case .facebookConnect(let token):
            return ["fbToken": token]
        case .emailConnect(let email):
            return ["email": email]
        case .emailRegister:
            return [:]
        case .socialRegister:
            return [:]
        case .tokens:
            return [:]
        case .refreshToken:
            return [:]
        case .checkAlias(let alias):
            return ["alias": alias]
        case .featuredTournaments:
            return [:]
        case .featuredGames:
            return [:]
        case .sports:
            return [:]
        case .users:
            return [:]
        case .game:
            return [:]
        case .joinGame:
            return [:]
        case .createGame:
            return [:]
        }
    }
    
    var body: [String: String] {
        switch self {
        case .login(let user):
            return user
        case .googleConnect:
            return [:]
        case .facebookConnect:
            return [:]
        case .emailConnect:
            return [:]
        case .emailRegister(let data):
            return data
        case .socialRegister(let data):
            return data
        case .tokens:
            return [:]
        case .refreshToken:
            return [:]
        case .checkAlias:
            return [:]
        case .featuredTournaments:
            return [:]
        case .featuredGames:
            return [:]
        case .sports:
            return [:]
        case .users:
            return [:]
        case .game:
            return [:]
        case .joinGame:
            return [:]
        case .createGame(let data):
            return data
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .login:
            return ["Content-Type": "application/json"]
        case .googleConnect:
            return [:]
        case .facebookConnect:
            return [:]
        case .emailConnect:
            return [:]
        case .emailRegister:
            return ["Content-Type": "application/json"]
        case .socialRegister:
            return ["x-access-token": UserDefaults.standard.string(forKey: "access-token") ?? "",
                    "Content-Type": "application/json"]
        case .tokens:
            return ["x-access-token": UserDefaults.standard.string(forKey: "access-token") ?? ""]
        case .refreshToken:
            return ["x-refresh-token": UserDefaults.standard.string(forKey: "refresh-token") ?? ""]
        case .checkAlias:
            return [:]
        case .featuredTournaments:
            return [:]
        case .featuredGames:
            return [:]
        case .sports:
            return [:]
        case .users:
            return [:]
        case .game:
            return [:]
        case .joinGame:
            return ["x-refresh-token": UserDefaults.standard.string(forKey: "refresh-token") ?? ""]
        case .createGame:
            return ["x-access-token": UserDefaults.standard.string(forKey: "access-token") ?? "",
                    "Content-Type": "application/json"]
        }
    }
}
