//
//  Game.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/5/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Game : Decodable {

    let id              : String
    let tournament      : Tournament
    let participants    : [Team]
    let wins            : Team?
    let loses           : Team?
    let concluded       : Bool
    let date            : String
}
