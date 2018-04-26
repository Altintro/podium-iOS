//
//  GameDetailAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import UIKit

final public class DetailGameAssembly {
    
    let tabBarController: UITabBarController
    let authenticationAssembly: AuthenticationAssembbly
    let detailUserAssembly: DetailUserAssembly
    let webServiceAssembly: WebServiceAssembly
    
    init(webServiceAssembly: WebServiceAssembly,
         authenticationAssembly: AuthenticationAssembbly,
         detailUserAssembly: DetailUserAssembly,
         tabBarController: UITabBarController) {
        self.webServiceAssembly = webServiceAssembly
        self.authenticationAssembly = authenticationAssembly
        self.detailUserAssembly = detailUserAssembly
        self.tabBarController = tabBarController
    }
    
    func presenter (identifier: String) -> DetailGamePresenter {
        return DetailGamePresenter(repository: repository(), authenticationNavigator: authenticationAssembly.authenticationNavigator(), detailUserNavigator: detailUserAssembly.navigator(), dateFormatter: webServiceAssembly.dateFormatter, identifier: identifier)
    }
    
    func headerPresenter() -> DetailGameHeaderPresenter {
        return DetailGameHeaderPresenter()
    }
    
    func thumbPresenter() -> ThumbPresenter {
        return ThumbPresenter()
    }
    
    func repository() -> DetailGameRepository {
        return DetailGameRepository(webService: webServiceAssembly.webService)
    }
    
    func navigator() -> DetailGameNavigator {
        return DetailGameNavigator(tabBarController: tabBarController, viewControllerProvider: self)
    }
}

extension DetailGameAssembly: DetailGameViewControllerProvider {
    func detailGameViewController(identifier: String) -> UIViewController {
        return DetailGameViewController(presenter: presenter(identifier: identifier), headerPresenter: headerPresenter(), thumbPresenter: thumbPresenter())
    }
}
