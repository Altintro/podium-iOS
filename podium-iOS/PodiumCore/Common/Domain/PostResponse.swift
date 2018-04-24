//
//  PostResponse.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct PostResponse<T:Decodable>: Decodable {
    let success: Bool
    let result: T?
    let message: String?
}
