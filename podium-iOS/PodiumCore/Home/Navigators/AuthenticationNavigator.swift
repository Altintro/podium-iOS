//
//  AuthenticationNavigator.swift
//  podium-iOS
//
//  Created by Tomas Moyano on 05.04.18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class AuthenticationNavigator {
    
    private let tabBarController: UITabBarController
    private unowned let viewControllerProvider: AuthenticationViewControllerProvider
    
    init(tabBarController: UITabBarController,
         viewControllerProvider: AuthenticationViewControllerProvider){
        self.tabBarController = tabBarController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showHomeViewController() {
        let viewController = viewControllerProvider.authenticationViewController()
        tabBarController.present(viewController, animated: true, completion: nil)
    }
}
