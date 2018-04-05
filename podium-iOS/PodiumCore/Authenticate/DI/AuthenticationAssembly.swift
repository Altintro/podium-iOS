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
    private let navigationController = UINavigationController ()
    
    init(webServiceAssembly: WebServiceAssembly){
        self.webServiceAssembly = webServiceAssembly
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
    
    func emailRegisterPresenter() -> RegisterPresenter {
        return EmailRegisterPresenter(repository: authenticationRepository(),
                                      magicLinkNavigator: magicLinkNavigator())
    }
    
    func socialRegisterPresenter() -> RegisterPresenter {
        return SocialRegisterPresenter(repository: authenticationRepository())
    }
    
    
}

extension AuthenticationAssembbly: EmailViewControllerProvider, MagicLinkViewControllerProvider, RegisterViewControllerProvider {
    
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
    
    func magicLinkViewController() -> UIViewController {
        return MagicLinkViewController(presenter: magicLinkPresenter())
    }
    
}
