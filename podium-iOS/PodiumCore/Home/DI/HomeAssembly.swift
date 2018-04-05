//
//  HomeAssembly.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final public class HomeAssembly {
    
    private let webServiceAssembly: WebServiceAssembly
    private let tabBarController: UITabBarController
    
    //Only for the case that the authentication is shown from home, this needs a navigationViewController
    private let navigationController = UINavigationController ()

    init(webServiceAssembly: WebServiceAssembly, tabBarController: UITabBarController) {
        
        self.webServiceAssembly = webServiceAssembly
        self.tabBarController = tabBarController
    }
    
    public func viewController() -> UIViewController {
        return HomeViewController(presenter: presenter(), stripPresenter: stripPresenter())
    }
    
    func authenticationNavigator() -> AuthenticationNavigator {
        return AuthenticationNavigator(tabBarController: tabBarController, viewControllerProvider: self)
    }
    
    func presenter() -> HomePresenter {
        return HomePresenter(repository: repository())
    }
    
    func stripPresenter() -> StripPresenter {
        return StripPresenter()
    }
    
    func authenticationRepository() -> AuthenticationRepositoryProtocol {
        return AuthenticationRepository(webService: webServiceAssembly.webService)
    }
    
    func emailNavigator() -> EmailNavigator {
        return EmailNavigator(navigationController: navigationController,
                              viewControllerProvider: self)
    }
    
    func registerNavigator() -> RegisterNavigator {
        return RegisterNavigator(navigationController: navigationController,
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
    
    func authenticationPresenter() -> AuthenticationPresenter {
        return AuthenticationPresenter(repository: authenticationRepository(),
                                       emailNavigator: emailNavigator())
    }
    
    func emailRegisterPresenter() -> RegisterPresenter {
        return EmailRegisterPresenter(repository: authenticationRepository(),
                                      magicLinkNavigator: magicLinkNavigator())
    }
    
    func magicLinkPresenter() -> MagicLinkPresenter {
        return MagicLinkPresenter()
    }
    
    func socialRegisterPresenter() -> RegisterPresenter {
        return SocialRegisterPresenter(repository: authenticationRepository())
    }
    
    func repository() -> HomeRepositoryProtocol {
        return HomeRespository(webService: webServiceAssembly.webService)
    }
}

extension HomeAssembly: AuthenticationViewControllerProvider, EmailViewControllerProvider , MagicLinkViewControllerProvider, RegisterViewControllerProvider {
    
    func magicLinkViewController() -> UIViewController {
        return MagicLinkViewController(presenter: magicLinkPresenter())
    }
    
    func registerViewController(registerType: RegisterType, email: String) -> UIViewController {
        let presenter : RegisterPresenter
        switch registerType {
        case .email:
            presenter = emailRegisterPresenter()
        case .social:
            presenter = socialRegisterPresenter()
        }
        
        return RegisterViewController(presenter: presenter, email: email)
    }
    
    
    func emailViewController() -> UIViewController {
        return EmailViewController(presenter: emailPresenter())
    }
    
    func authenticationViewController() -> UIViewController {
        return AuthenticationViewController(presenter: authenticationPresenter())
    }
    
}

