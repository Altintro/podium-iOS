//
//  DetailGameNavigator.swift
//  podium-iOS
//
//  Created by Fernando Frances on 26/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class DetailGameNavigator {
    private let tabBarController: UITabBarController
    private let viewControllerProvider: DetailGameViewControllerProvider
    
    init(tabBarController: UITabBarController, viewControllerProvider: DetailGameViewControllerProvider){
        self.tabBarController = tabBarController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showDetailGame(withIdentifier identifier: String){
        let viewController = viewControllerProvider.detailGameViewController(identifier: identifier)

        if  let navigator: UINavigationController = tabBarController.selectedViewController! as? UINavigationController {
            navigator.pushViewController(viewController, animated: true)
        }
    }
    
}
