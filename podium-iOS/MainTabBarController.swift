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

        let homeIcon = UITabBarItem(title: nil, image: UIImage(named:"home_btn"), selectedImage: UIImage(named:"home_btn"))
        let createIcon = UITabBarItem(title: nil, image: UIImage(named:"create_btn"), selectedImage: UIImage(named:"create_btn"))
        let profileIcon = UITabBarItem(title: nil, image: UIImage(named:"profile_btn"), selectedImage: UIImage(named:"profile_btn"))
        
        tabBarItems = [homeIcon, createIcon, profileIcon]
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        
        var count = 0
        for vc in viewControllers! {
            vc.tabBarItem = tabBarItems[count]
            count += 1
        }
        
        super.setViewControllers(viewControllers, animated: animated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
