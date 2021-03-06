//
//  NewUserSection.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

enum RegisterSection {
    case field(type: FieldType)
    case thumbView(title: String, items: [ThumbItem])
    case submit(title: String)
}

enum FieldType: String {
    case alias
    case name
}
