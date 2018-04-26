//
//  DetailUserNavigator.swift
//  podium-iOS
//
//  Created by Fernando Frances on 26/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class DetailUserNavigator {
    private let tabBarController: UITabBarController
    private let viewControllerProvider: DetailUserViewControllerProvider
    
    init(tabBarController: UITabBarController, viewControllerProvider: DetailUserViewControllerProvider){
        self.tabBarController = tabBarController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showDetailUser(withIdentifier identifier: String){
        let viewController = viewControllerProvider.detailUserViewController(identifier: identifier)
        
        if  let navigator: UINavigationController = tabBarController.selectedViewController! as? UINavigationController {
            navigator.pushViewController(viewController, animated: true)
        }
    }
    
}
