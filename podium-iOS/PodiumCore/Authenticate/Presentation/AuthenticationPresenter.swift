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
}

final class AuthenticationPresenter: NSObject {
    private let repository: AuthenticationRepositoryProtocol
    private let disposeBag = DisposeBag()
    
    weak var view: AuthenticationView?
    
    init(repository: AuthenticationRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad() {
        view?.title = NSLocalizedString("Sign up or Sign in", comment: "")
        configureGoogleSignIn(delegate: self)
    }
    
    private func configureGoogleSignIn(delegate: GIDSignInDelegate) -> Void {
        GIDSignIn.sharedInstance().clientID = Bundle(for: AuthenticationPresenter.self).infoDictionary!["GOOGLE_CLIENT_ID"] as? String ?? ""
        GIDSignIn.sharedInstance().delegate = delegate;
    }
    
    func userWantsToSignUpWithEmail() {
        // Show email sign up view
    }
    
    func userAlreadyHasAnAccount() {
        // Show Sign in view
    }
    
    
    func didTapRegister(info:[String:String]) {

        repository.registerUser(userRegistration: info)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] _ in
                guard let `self` = self else {
                    return
                }
                print("Success")
                }, onError: { error in
                    print("Error")
                }, onDisposed: { [weak self] in
                    print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
}

extension AuthenticationPresenter: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            repository.googleSignIn(token: user.authentication.idToken)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: {[weak self] registerResponse in
                    guard let `self` = self else {
                        return
                    }
                    print(registerResponse.auth)
                    print("Google Authentication Success")
                    
                    }, onError: { error in
                        print("Google Authentication Error")
                    }, onDisposed: { [weak self] in
                        print("onDisposed")
                })
                .disposed(by: disposeBag)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("disconnect")
    }
}
