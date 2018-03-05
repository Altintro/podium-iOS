//
//  Sport.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/5/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct ActivitySport: Decodable {
    
    let id                  : String
    let name                : String
    let image               : String
    let description         : String
    let ranking             : [User]
    let rules               : String
    let popularity          : Float
    let sides               : Sides
    let activeTournaments   : [Tournament]
    let openTournaments     : [Tournament]
}
