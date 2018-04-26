//
//  DetailResponse.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

import Foundation

struct DetailResponse<T: Decodable>: Decodable {
    let result: T
}
