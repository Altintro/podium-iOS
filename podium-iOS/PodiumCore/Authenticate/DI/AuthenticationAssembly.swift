//
//  AuthenticationAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final public class AuthenticationAssembbly {
    
    private let webServiceAssembly: WebServiceAssembly
    private let navigationController: UINavigationController
    
    init(webServiceAssembly: WebServiceAssembly,
         navigationController: UINavigationController){
        self.webServiceAssembly = webServiceAssembly
        self.navigationController = navigationController
    }
    
    public func viewController() -> UIViewController {
        return AuthenticationViewController(presenter: authenticationPresenter())
    }
    
    func authenticationPresenter() -> AuthenticationPresenter {
        return AuthenticationPresenter(repository: authenticationRepository(),
                                       emailNavigator: emailNavigator())
    }
    
    func authenticationRepository() -> AuthenticationRepositoryProtocol {
        return AuthenticationRepository(webService: webServiceAssembly.webService)
    }
    
    func emailNavigator() -> EmailNavigator {
        return EmailNavigator(navigationController: navigationController,
                              viewControllerProvider: self)
    }
    
    func emailPresenter() -> EmailPresenter {
        return EmailPresenter(repository: authenticationRepository(),
                              magicLinkNavigator: magicLinkNavigator())
    }
    
    func magicLinkNavigator() -> MagicLinkNavigator {
        return MagicLinkNavigator(navigationController: navigationController,
                                  viewControllerProvider: self)
    }
    
    func magicLinkPresenter() -> MagicLinkPresenter {
        return MagicLinkPresenter()
    }
    
}

extension AuthenticationAssembbly: EmailViewControllerProvider, MagicLinkViewControllerProvider {
    func emailViewController() -> UIViewController {
        return EmailViewController(presenter: emailPresenter())
    }
    
    func magicLinkViewController() -> UIViewController {
        return MagicLinkViewController(presenter: magicLinkPresenter())
    }
    
}
