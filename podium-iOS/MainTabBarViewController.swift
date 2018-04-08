//
//  TabBarViewController.swift
//  podium-iOS
//
//  Created by Tomas Moyano on 05.04.18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    //TODO: See how to pass an AppAssembly so that it doesnt have a circle reference
    private(set) var appAssembly: AppAssembly

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = appAssembly.coreAssembly.homeAssembly.viewController()
        let createViewController = appAssembly.coreAssembly.homeAssembly.viewController()
        let profileViewController = appAssembly.coreAssembly.homeAssembly.viewController()
        
//        let homeViewController = UIViewController(nibName: nil, bundle: nil)
//        let createViewController = UIViewController(nibName: nil, bundle: nil)
//        let profileViewController = UIViewController(nibName: nil, bundle: nil)

        //TODO: add real sections for create and profile
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        createViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        profileViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        let tabBarList = [homeViewController, createViewController, profileViewController]
        
        viewControllers = tabBarList
    }
    
    init(appAssembly: AppAssembly) {
        self.appAssembly = appAssembly
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
