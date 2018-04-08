//
//  AuthenticationPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift
import GoogleSignIn

protocol AuthenticationView: class {
    var title: String? { get set }
    func pop()
}

final class AuthenticationPresenter: NSObject {
    let repository: AuthenticationRepositoryProtocol
    private let emailNavigator: EmailNavigator
    private let tabBarController: UITabBarController
    
    let disposeBag = DisposeBag()
    
    weak var view: AuthenticationView?
    
    init(repository: AuthenticationRepositoryProtocol, emailNavigator: EmailNavigator,
         tabBarController: UITabBarController){
        self.repository = repository
        self.emailNavigator = emailNavigator
        self.tabBarController = tabBarController
    }
    
    func didLoad() {
        view?.title = NSLocalizedString("Sign up or Sign in", comment: "")
        configureGoogleSignIn(delegate: self)
    }
    
    private func configureGoogleSignIn(delegate: GIDSignInDelegate) -> Void {
        GIDSignIn.sharedInstance().clientID = Bundle(for: AuthenticationPresenter.self).infoDictionary!["GOOGLE_CLIENT_ID"] as? String ?? ""
        GIDSignIn.sharedInstance().delegate = delegate;
    }
    
    func emailConnect() {
        emailNavigator.showEmailViewController()
    }
    
    func dismiss() {
        tabBarController.dismiss(animated: true, completion: nil)
    }
    
}
