//
//  RegisterResponse.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct RegisterResponse: Decodable {
    let auth: Bool
    let token: String?
}

struct TokenResponse: Decodable {
    let auth: Bool
    let accessToken: String?
    let refreshToken: String?
}
