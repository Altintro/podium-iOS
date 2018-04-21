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
    func dismiss()
}

final class AuthenticationPresenter: NSObject {
    let repository: AuthenticationRepositoryProtocol
    private let emailNavigator: EmailNavigator
    private let registerNavigator: RegisterNavigator
    let disposeBag = DisposeBag()
    
    weak var view: AuthenticationView?
    
    init(repository: AuthenticationRepositoryProtocol, emailNavigator: EmailNavigator, registerNavigator: RegisterNavigator){
        self.repository = repository
        self.emailNavigator = emailNavigator
        self.registerNavigator = registerNavigator
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
    
    func facebookConnect(token: String) {
        repository.facebookConnect(token: token)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] authResponse in
                guard let `self` = self else {
                    return
                }
                self.onSocialAuthenticationResponse(response: authResponse)
                }, onError: { error in
                    print(error)
                }, onDisposed: { [weak self] in
                    print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
    func onSocialAuthenticationResponse(response: AuthenticationResponse) {
        if response.auth {
            UserDefaults.standard.set(response.accessToken, forKey:"access-token")
            UserDefaults.standard.set(response.refreshToken,forKey:"refresh-token")
            switch response.type {
            case .signin?:
                self.view?.dismiss()
            case .signup?:
                registerNavigator.showRegisterViewController(registerType: .social, email: "")
            case .none:
                self.view?.dismiss()
            }
        }
    }
}
