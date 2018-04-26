//
//  MainTabBarController.swift
//  podium-iOS
//
//  Created by Tomas Moyano on 08.04.18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    var tabBarItems: [UITabBarItem]
    
    init() {

        let homeIcon = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home_btn"), selectedImage: #imageLiteral(resourceName: "home_btn"))
        let createIcon = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "create_btn"), selectedImage: #imageLiteral(resourceName: "create_btn"))
        let profileIcon = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "profile_btn"), selectedImage: #imageLiteral(resourceName: "profile_btn"))
        
        tabBarItems = [homeIcon, createIcon, profileIcon]
        tabBarItems.forEach { $0.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)}
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        
        var count = 0
        for vc in viewControllers! {
            vc.tabBarItem = tabBarItems[count]
            count += 1
        }
        
        super.setViewControllers(viewControllers, animated: animated)
    }
    
}

