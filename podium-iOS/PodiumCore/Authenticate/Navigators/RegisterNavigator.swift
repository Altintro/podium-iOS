//
//  NewUserNavigator.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class RegisterNavigator {
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: RegisterViewControllerProvider
    
    init(navigationController: UINavigationController,
         viewControllerProvider: RegisterViewControllerProvider){
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showRegisterViewController(registerType: RegisterType, email: String){
        let viewController = viewControllerProvider.registerViewController(registerType: registerType, email: email)
        navigationController.pushViewController(viewController,
                                                animated: true)
    }
}
