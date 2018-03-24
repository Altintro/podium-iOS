//
//  EmailAtuhenticationNavigator.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class EmailNavigator {
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: EmailViewControllerProvider
    
    init(navigationController: UINavigationController,
         viewControllerProvider: EmailViewControllerProvider){
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showEmailViewController() {
        let viewController = viewControllerProvider.emailViewController()
        navigationController.pushViewController(viewController,
                                               animated: true)
    }
    
}

