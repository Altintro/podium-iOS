//
//  StripItem+Sport.swift
//  podium-iOS
//
//  Created by Fernando Frances on 02/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

extension StripItem {
    init(sport: Sport){
        title = sport.name
        metadata = String(sport.popularity)
        image = sport.image
    }
}

