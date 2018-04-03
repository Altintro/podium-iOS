//
//  MagicLinkNavigator.swift
//  podium-iOS
//
//  Created by Fernando Frances on 28/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final class MagicLinkNavigator {
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: MagicLinkViewControllerProvider
    
    init(navigationController: UINavigationController,
         viewControllerProvider: MagicLinkViewControllerProvider){
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showMagicLinkViewController() {
        let viewController = viewControllerProvider.magicLinkViewController()
        navigationController.pushViewController(viewController,
                                                animated: true)
    }
    
}
