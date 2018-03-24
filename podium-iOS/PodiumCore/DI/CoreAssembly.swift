//
//  CoreAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 09/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final public class CoreAssembly {
    private(set) lazy var webServiceAssembly = WebServiceAssembly()
    
    public private(set) lazy var authenticationAssembbly = AuthenticationAssembbly(webServiceAssembly: webServiceAssembly)
    
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
