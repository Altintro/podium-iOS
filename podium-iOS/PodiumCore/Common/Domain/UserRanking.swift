//
//  UserRanking.swift
//  podium-iOS
//
//  Created by Fernando Frances on 06/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct UserRanking: Decodable {
    
    let sport   : Sport
    let ranking : Int
    let points  : Float
}
