//
//  HomeSection.swift
//  podium-iOS
//
//  Created by Fernando Frances on 02/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct StripItem {
    let title: String
    let participants: [User]
    let sport: String
}

enum HomeSection {
    case strip(items: [StripItem])
}

