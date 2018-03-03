//
//  User.swift
//  podium-iOS
//
//  Created by Fernando Frances on 03/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct User: Decodable {
    let name: String
    let userName: String
    let email: String
    let image: String
    let gender: String
    let birthdate: Date
    let latitude: Float
    let longitude: Float
    // let ranking
    // let points
//    let interests: [Sport]
//    let emblems : [Emblem]
//    let played : [Tournament]
//    let playing : [Tournament]
//    let won : [Tournament]
//    let upcoming: [Tournament]
}


