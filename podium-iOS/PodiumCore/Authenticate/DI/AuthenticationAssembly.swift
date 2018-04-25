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
    private let tabBarController: UITabBarController
    
    private(set) lazy var navigationController = UINavigationController()
    
    init(webServiceAssembly: WebServiceAssembly,
         tabBarController: UITabBarController){
        self.webServiceAssembly = webServiceAssembly
        self.tabBarController = tabBarController
    }
    
    func viewController() -> UIViewController {
        return AuthenticationViewController(presenter: authenticationPresenter())
    }
    
    func authenticationPresenter() -> AuthenticationPresenter {
        return AuthenticationPresenter(repository: authenticationRepository(),
                                       emailNavigator: emailNavigator(),
                                       registerNavigator: registerNavigator())
    }
    
    func authenticationRepository() -> AuthenticationRepositoryProtocol {
        return AuthenticationRepository(webService: webServiceAssembly.webService)
    }
   
    func authenticationNavigator() -> AuthenticationNavigator {
        return AuthenticationNavigator(viewControllerProvider: self, tabBarController: tabBarController, navigationController: navigationController)
    }
    
    func emailNavigator() -> EmailNavigator {
        return EmailNavigator(navigationController: navigationController,
                              viewControllerProvider: self)
    }
    
    func emailPresenter() -> EmailPresenter {
        return EmailPresenter(repository: authenticationRepository(),
                              magicLinkNavigator: magicLinkNavigator(),
                              registerNavigator: registerNavigator())
    }
    
    func magicLinkNavigator() -> MagicLinkNavigator {
        return MagicLinkNavigator(navigationController: navigationController,
                                  viewControllerProvider: self)
    }
    
    func magicLinkPresenter() -> MagicLinkPresenter {
        return MagicLinkPresenter()
    }
    
    func registerNavigator() -> RegisterNavigator {
        return RegisterNavigator(navigationController: navigationController,
                                 viewControllerProvider: self)
    }
    
    func registerPresenter(type: RegisterType, email: String) -> RegisterPresenter {
        return RegisterPresenter(repository: authenticationRepository(),
                                 magicLinkNavigator: magicLinkNavigator(),
                                 type: type, email: email)
    }
    
    func sportsPresenter() -> ThumbPresenter {
        return ThumbPresenter()
    }
    
    
}

extension AuthenticationAssembbly: AuthenticationViewControllerProvider, EmailViewControllerProvider, MagicLinkViewControllerProvider, RegisterViewControllerProvider {
    
    func authenticationViewController() -> UIViewController {
        return viewController()
    }
    
    func registerViewController(registerType: RegisterType, email: String) -> UIViewController {
        let presenter : RegisterPresenter
        presenter = registerPresenter(type: registerType, email: email)
        return RegisterViewController(presenter: presenter,
                                      sportsPresenter: sportsPresenter())
    }
    
    func emailViewController() -> UIViewController {
        return EmailViewController(presenter: emailPresenter())
    }
    
    func magicLinkViewController() -> UIViewController {
        return MagicLinkViewController(presenter: magicLinkPresenter())
    }
    
}
