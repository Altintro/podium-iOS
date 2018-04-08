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
    
    public private(set) lazy var homeAssembly = HomeAssembly(webServiceAssembly: webServiceAssembly, authenticationAssembly: authenticationAssembbly, tabBarController: tabBarController)
    
    var tabBarController = MainTabBarController()
    
    init () {
        
        let homeVC = homeAssembly.viewController()
        let createVC = UIViewController()
        createVC.view.backgroundColor = .blue
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .red

        tabBarController.setViewControllers([homeVC, createVC, profileVC], animated: true)
    }
}
