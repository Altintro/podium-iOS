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
    public private(set) lazy var homeAssembly = HomeAssembly(webServiceAssembly: webServiceAssembly, tabBarController: tabBarController)
    
    private let tabBarController: UITabBarController
    
    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
}
