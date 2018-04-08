//
//  MainTabBarController.swift
//  podium-iOS
//
//  Created by Tomas Moyano on 08.04.18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    //private let theViewControllers: [UIViewController]
    private let coreAssembly: CoreAssembly
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let homeVC = coreAssembly.homeAssembly.viewController()
        let downloadsVC = UIViewController()
        downloadsVC.view.backgroundColor = UIColor.blue
        let historyVC = UIViewController()
        historyVC.view.backgroundColor = UIColor.cyan

        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"home_btn"), selectedImage: UIImage(named:"home_btn"))
        downloadsVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"create_btn"), selectedImage: UIImage(named:"create_btn"))
        historyVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named:"profile_btn"), selectedImage: UIImage(named:"profile_btn"))

        let controllers = [homeVC, downloadsVC, historyVC]
        self.viewControllers = controllers
    }
    
    init(coreAssembly: CoreAssembly) {
        self.coreAssembly = coreAssembly
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
