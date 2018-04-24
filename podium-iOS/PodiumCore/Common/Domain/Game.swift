//
//  Game.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/5/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Game : Decodable {

    let _id             : String
    let name            : String
    let sport           : Sport?
    let description     : String?
    let tournament      : Tournament?
    let participants    : [User]?
    let teams           : [Team]?
    let wins            : Team?
    let loses           : Team?
    let concluded       : Bool?
    let open            : Bool
    let date            : String?
    let latitude        : Float?
    let longitude       : Float?
    let modality        : Modality
    let levelAverage    : Level?
}
