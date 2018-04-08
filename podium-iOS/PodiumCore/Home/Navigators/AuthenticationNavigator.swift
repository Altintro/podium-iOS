//
//  AuthenticationNavigator.swift
//  podium-iOS
//
//  Created by Tomas Moyano on 08.04.18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class AuthenticationNavigator {
    
    private unowned let viewControllerProvider: AuthenticationViewControllerProvider
    private let tabBarController: UITabBarController
    
    init(viewControllerProvider: AuthenticationViewControllerProvider,
        tabBarController: UITabBarController){
        self.viewControllerProvider = viewControllerProvider
        self.tabBarController = tabBarController
    }
    
    func showAuthenticationViewController() {
        let viewController = viewControllerProvider.authenticationViewController()
        tabBarController.present(viewController, animated: true, completion: nil)
    }
    
}
