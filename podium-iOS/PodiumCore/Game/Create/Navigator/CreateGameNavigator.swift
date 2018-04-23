//
//  CreateGameNavigator.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import UIKit

final class CreateGameNavigator {
    
    private unowned let viewControllerProvider: CreateGameViewControllerProvider
    private let tabBarController: UITabBarController
    
    init(viewControllerProvider: CreateGameViewControllerProvider,
         tabBarController: UITabBarController){
        self.viewControllerProvider = viewControllerProvider
        self.tabBarController = tabBarController
    }
    
    func showCreateGameViewController() {
        let viewController = viewControllerProvider.createGameViewController()
        tabBarController.present(viewController, animated: true, completion: nil)
    }
    
}
