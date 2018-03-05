//
//  Clasification.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/5/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Clasification : Decodable {
    
    let game    : Game
    let round   : Int
    let match   : Int
}
