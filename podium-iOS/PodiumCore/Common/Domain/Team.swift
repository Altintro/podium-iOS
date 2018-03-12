//
//  Team.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/5/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Team : Decodable {
    
    let id          : String
    let players     : [User]
    let name        : String
    let image       : String?
    let description : String?
}
