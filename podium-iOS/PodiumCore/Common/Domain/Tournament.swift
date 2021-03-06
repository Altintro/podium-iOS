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
    let sport           : Sport
    let compType        : CompType
    let players         : [User]?
    let participants    : [Team]?
    let levelAverage    : Level?
    let modality        : Modality
    let starts          : String
    let finishes        : String
    let clasification   : [Clasification]?
    let latitude        : Float?
    let longitude       : Float?
    let open            : Bool
    let points          : Float?
}
