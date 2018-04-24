//
//  User.swift
//  podium-iOS
//
//  Created by Fernando Frances on 03/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct User: Decodable {
    
    let _id: String
    let name: String
    let alias: String
    let email: String?
    let profilePic: String
    let gender: String?
    let birthdate: String?
    let latitude: Float?
    let longitude: Float?
    let interests: [Sport]?
    let emblems: [Emblem]?
    let tournamentsPlayed: [Tournament]?
    let tournamentsPlaying: [Tournament]?
    let tournamentsWon: [Tournament]?
    let tournamentsUpcoming: [Tournament]?
    let gamesPlayed: [Game]?
    let gamesPlaying: [Game]?
    let gamesWon: [Game]?
    let gamesUpcoming: [Game]?
    let ranking  : [UserRanking]?
    let fb: Facebook?
    let google: Google?
    let hasPassword: Bool?
    let mergedWithFB: Bool?
    let mergedWithGoogle: Bool?
}




