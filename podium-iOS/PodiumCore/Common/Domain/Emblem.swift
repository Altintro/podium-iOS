//
//  Emblem.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/5/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

struct Emblem: Decodable {
    
    let id              : String
    let name            : String
    let sigil           : String
    let description     : String
    let requirements    : String
    let users           : [User]?
}
