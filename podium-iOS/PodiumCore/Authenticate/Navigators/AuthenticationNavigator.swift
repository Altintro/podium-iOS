//
//  AuthenticationNavigator.swift
//  podium-iOS
//
//  Created by Fernando Frances on 10/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import UIKit

final class AuthenticationNavigator {
    
    private unowned let viewControllerProvider: AuthenticationViewControllerProvider
    private let navigationController: UINavigationController
    private let tabBarController: UITabBarController
    
    init(viewControllerProvider: AuthenticationViewControllerProvider,
         tabBarController: UITabBarController, navigationController: UINavigationController){
        self.viewControllerProvider = viewControllerProvider
        self.tabBarController = tabBarController
        self.navigationController = navigationController
    }
    
    func showAuthenticationViewController() {
        let viewController = viewControllerProvider.authenticationViewController()
        navigationController.pushViewController(viewController,
                                                animated: false)
        tabBarController.present(navigationController, animated: true, completion: nil)
    }
    
}
