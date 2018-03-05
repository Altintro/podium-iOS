//
//  Clasification.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/5/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Clasification : Decodable {
    
    let id          : String
    let chart       : [Game:Int]
    let compType    : CompType
    //let tournament  : Tournament     // Cannot have recursive reference to tournamente that has a reference to Clasification, anyway we dont need it ??
}
