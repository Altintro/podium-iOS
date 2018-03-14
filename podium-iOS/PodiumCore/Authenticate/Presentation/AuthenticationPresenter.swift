//
//  AuthenticationPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol AuthenticationView: class {
    var title: String? { get set }
}

final class AuthenticationPresenter {
    private let interactor: AuthenticationInteractorProtocol
    private let disposeBag = DisposeBag()
    
    weak var view: AuthenticationView?
    
    init(interactor: AuthenticationInteractorProtocol){
        self.interactor = interactor
    }
    
    func didLoad() {
        view?.title = NSLocalizedString("Sign up or Sign in", comment: "")
    }
    
    func userDidRegister() {
        // Make Logic for User Registration
    }
    
    func didTapRegister() {
        // Dummy
        let dummyRegistration = ["name":"dummyName",
                                 "alias":"ddummyAlias",
                                 "email":"ddummyEmail",
                                 "pass":"ddummyPass"]
        
        interactor.registerUser(userRegistration: dummyRegistration)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] _ in
                guard let `self` = self else {
                    return
                }
                    print("Success")
                self.userDidRegister()
                }, onError: { error in
                    print("Error")
                }, onDisposed: { [weak self] in
                    print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
}
