//
//  Tournament.swift
//  podium-iOS
//
//  Created by Fernando Frances on 03/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Tournament: Decodable {
    
    let id              : String
    let name            : String
    let activitySport   : ActivitySport
    let compType        : CompType
    let oponents        : [Team]   // better call it participants?
    let players         : [User]
    let games           : [Game]
    let levelAverage    : Level
    let starts          : Date
    let finishes        : Date
    let clasification   : Clasification
    let latitude        : Float
    let longitude       : Float
    let open            : Bool
    let rankPoints      : Float //Better Int??
    
}
