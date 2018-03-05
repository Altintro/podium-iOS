//
//  Game.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/5/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Game : Decodable, Hashable {
    
    var hashValue: Int
    
    static func ==(lhs: Game, rhs: Game) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id          : String
    let tournament  : Tournament
    let oponents    : [Team]
    let wins        : Team
    let loses       : Team
    let concluded   : Bool
    let date        : Date
}
