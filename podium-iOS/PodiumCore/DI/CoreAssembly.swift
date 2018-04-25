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
    
    public private(set) lazy var authenticationAssembbly = AuthenticationAssembbly(webServiceAssembly: webServiceAssembly, tabBarController: tabBarController)
    
    public private(set) lazy var homeAssembly = HomeAssembly(webServiceAssembly: webServiceAssembly, authenticationAssembly: authenticationAssembbly)
    
    public private(set) lazy var createGameAssembly = CreateGameAssembly(webServiceAssembly: webServiceAssembly, tabBarController: tabBarController)
    
    public private(set) lazy var detailUserAssembly = DetailUserAssembly(webServiceAssembly: webServiceAssembly, navigationController:profileNavigationController)
    
    private let profileNavigationController: UINavigationController
    private let tabBarController: UITabBarController
    
    public init(tabBarController: UITabBarController, profileNavigationController: UINavigationController){
        self.tabBarController = tabBarController
        self.profileNavigationController = profileNavigationController
    }
}
