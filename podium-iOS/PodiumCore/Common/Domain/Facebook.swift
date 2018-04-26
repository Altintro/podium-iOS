//
//  Facebook.swift
//  podium-iOS
//
//  Created by Fernando Frances on 12/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

struct Facebook: Decodable {
    
    let id: String
    let name: String
    let email: String
    let picture: FacebookPicture
    
    struct FacebookPicture: Decodable {
        let data: FacebookPictureData
    }
    
    struct FacebookPictureData: Decodable {
        let url : String
    }
}


