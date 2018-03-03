//
//  WebService.swift
//  podium-iOS
//
//  Created by Fernando Frances on 01/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation


final internal class WebService {
    private let session = URLSession(configuration: .default)
    private let baseURL = URL(string: "https://node.winatpodium.com")!
    private let decoder = JSONDecoder()
    
}
