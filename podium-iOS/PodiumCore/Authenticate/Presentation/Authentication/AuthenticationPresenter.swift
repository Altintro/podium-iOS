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
    let disposeBag = DisposeBag()
    
    weak var view: AuthenticationView?
    
    init(repository: AuthenticationRepositoryProtocol, emailNavigator: EmailNavigator){
        self.repository = repository
        self.emailNavigator = emailNavigator
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
                if authResponse.auth {
                    UserDefaults.standard.set(authResponse.accessToken, forKey:"x-access-token")
                    UserDefaults.standard.set(authResponse.refreshToken,forKey:"x-refresh-token")
                    self.view?.dismiss()
                }
                }, onError: { error in
                    print(error)
                }, onDisposed: { [weak self] in
                    print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
}
