//
//  NewUserSection.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

enum RegisterSection {
    case field(type: fieldType)
    case sports
}

enum fieldType: String {
    case alias = "alias"
    case name = "name"
}
