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
        self.registerNavigator.showRegisterViewController(registerType: .email)
//        repository.emailConnect(email: email)
//        .observeOn(MainScheduler.instance)
//            .subscribe(onNext: {[weak self] check in
//                guard let `self` = self else {
//                    return
//                }
//                print("Check email response:\(check)")
//                // Check if user exists or not with "check" and show register or magiclink
//                self.registerNavigator.showRegisterViewController(registerType: .email)
//               // self.magicLinkNavigator.showMagicLinkViewController()
//                }, onError: { error in
//                    print("Check email error:\(error)")
//            }, onDisposed: { [weak self] in
//                print("onDisposed")
//            })
//        .disposed(by: disposeBag)
    }
    
}