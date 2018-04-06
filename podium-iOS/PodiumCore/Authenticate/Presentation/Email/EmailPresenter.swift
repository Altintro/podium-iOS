//
//  EmailPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol EmailView: class {
    var title: String? { get set }
    func pop()
}

final class EmailPresenter {
    private let repository: AuthenticationRepositoryProtocol
    private let magicLinkNavigator: MagicLinkNavigator
    private let registerNavigator: RegisterNavigator
    private let disposeBag = DisposeBag()
    
    weak var view: EmailView?
    
    init(repository: AuthenticationRepositoryProtocol,
         magicLinkNavigator: MagicLinkNavigator,
         registerNavigator: RegisterNavigator){
        self.repository = repository
        self.magicLinkNavigator = magicLinkNavigator
        self.registerNavigator = registerNavigator
    }
    
    func didLoad() {
        view?.title = NSLocalizedString("Continue with email", comment: "")
    }
    
    func didTapCheckEmail(email: String) {
        repository.emailConnect(email: email)
        .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] response in
                guard let `self` = self else {
                    return
                }
                if response.auth {
                    self.magicLinkNavigator.showMagicLinkViewController()
                } else {
                    self.registerNavigator.showRegisterViewController(registerType: .email,
                                                                      email: email)
                }
                
                }, onError: { error in
                    self.view?.pop()
            }, onDisposed: { [weak self] in
                print("onDisposed")
            })
        .disposed(by: disposeBag)
    }
    
}
