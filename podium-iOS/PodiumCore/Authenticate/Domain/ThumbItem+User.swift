//
//  ThumbItem+User.swift
//  podium-iOS
//
//  Created by Fernando Frances on 25/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

extension ThumbItem {
    init(user: User){
        thumbnail = user.profilePic
        identifier = user._id
        modelType = .user
    }
}
