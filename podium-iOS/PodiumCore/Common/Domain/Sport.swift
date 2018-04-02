//
//  Sport.swift
//  podium-iOS
//
//  Created by Fernando Frances on 05/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Sport: Decodable {
    
    let _id                 : String
    let name                : String
    let image               : String
    let description         : String
    let ranking             : [User]?
    let rules               : String
    let popularity          : Float
    let activeTournaments   : [Tournament]?
    let openTournaments     : [Tournament]?
    let activeGames         : [Game]?
    let openGames           : [Game]?
}
