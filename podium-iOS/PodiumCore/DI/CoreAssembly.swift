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
    
    public private(set) lazy var authenticationAssembly = AuthenticationAssembbly(webServiceAssembly: webServiceAssembly, tabBarController: tabBarController)
    
    public private(set) lazy var homeAssembly = HomeAssembly(webServiceAssembly: webServiceAssembly, authenticationAssembly: authenticationAssembly, detailGameAssembly: detailGameAssembly)
    
    public private(set) lazy var createGameAssembly = CreateGameAssembly(webServiceAssembly: webServiceAssembly, tabBarController: tabBarController)
    
    public private(set) lazy var detailUserAssembly = DetailUserAssembly(webServiceAssembly: webServiceAssembly,tabBarController : tabBarController)
    
    public private(set) lazy var detailGameAssembly = DetailGameAssembly(webServiceAssembly: webServiceAssembly, authenticationAssembly: authenticationAssembly, tabBarController: tabBarController)
    
    private let tabBarController: UITabBarController
    
    public init(tabBarController: UITabBarController){
        self.tabBarController = tabBarController
    }
}
