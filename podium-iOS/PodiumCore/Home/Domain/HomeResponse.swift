//
//  GamesResponse.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation


struct GameResponse: Decodable {
    let result: [Game]
}

struct SportResponse: Decodable {
    let result: [Sport]
}
