//
//  AuthenticationPresenter+GoogleDelegates.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import GoogleSignIn
import RxSwift

extension AuthenticationPresenter: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            repository.googleConnect(token: user.authentication.idToken)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: {[weak self] registerResponse in
                    guard let `self` = self else {
                        return
                    }
                    if registerResponse.auth {
                        UserDefaults.standard.set(registerResponse.token, forKey:"x-access-token")
                        self.view?.pop()
                    }
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

extension AuthenticationPresenter:  GIDSignInUIDelegate {
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        // Stop animating activity indicator
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        // 
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        //
    }
}
