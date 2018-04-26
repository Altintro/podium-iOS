//
//  StripItem+Game.swift
//  podium-iOS
//
//  Created by Fernando Frances on 02/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

extension StripItem {
    init(game: Game) {
        identifier = game._id
        title = game.name
        sport = game.sport?.name ?? ""
        participants = game.participants ?? []
    }
}

