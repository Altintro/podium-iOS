//
//  HomeResponse.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct ListResponse<T: Decodable>: Decodable {
    let result: [T]
}
