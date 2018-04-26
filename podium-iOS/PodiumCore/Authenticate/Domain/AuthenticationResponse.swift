//
//  RegisterResponse.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct AuthenticationResponse: Decodable {
    let auth: Bool
    let type: SignInType?
    let accessToken: String?
    let refreshToken: String?
}

enum SignInType: String, Decodable {
    case signin
    case signup
}
