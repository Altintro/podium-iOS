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
    let image: String?
    let metadata: String
}

enum HomeSection {
    case strip(title: String, items: [StripItem])
}
