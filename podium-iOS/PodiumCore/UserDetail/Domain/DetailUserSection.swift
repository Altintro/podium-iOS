//
//  DetailUserSection.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct DetailUserHeader {
    let profilePic: String?
    let name: String
    let alias: String
}

enum DetailUserSection {
    case header(DetailUserHeader)
    case thumbView(title: String, items: [ThumbItem])
    case gamesPlaying(title: String, items: [StripItem])
}

extension DetailUserHeader {
    init(user: User){
        profilePic = user.profilePic
        name = user.name
        alias = user.alias
    }
}
