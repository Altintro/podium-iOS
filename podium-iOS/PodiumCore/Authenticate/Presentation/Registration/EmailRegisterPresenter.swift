//
//  EmailNewUserPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

final class EmailRegisterPresenter: RegisterPresenter {
    private let repository: AuthenticationRepositoryProtocol
    private let magicLinkNavigator: MagicLinkNavigator
    let disposeBag = DisposeBag()
    
    weak var view: RegisterView?
    
    init(repository: AuthenticationRepositoryProtocol, magicLinkNavigator: MagicLinkNavigator){
        self.repository = repository
        self.magicLinkNavigator = magicLinkNavigator
    }
    
    func didLoad() {
        self.view?.update(with: self.registerSections())
    }
    
    func submit(withUserData data: [String : String]) {
        repository.emailRegister(user: data)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] response in
                guard let `self` = self else {
                    return
                }
                if response.auth {
                    self.magicLinkNavigator.showMagicLinkViewController()
                }
                }, onError: { error in
                    print("Email register error: \(error)")
                }, onDisposed: { [weak self] in
                    print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
    private func registerSections() -> [RegisterSection] {
        let registerSections : [RegisterSection] = [
            .field(type: .name),
            .field(type: .alias),
//          .sports(title: NSLocalizedString("What sports do you practice?", comment: "")),
            .submit(title: "Sign up!")
            
        ]
        return registerSections
    }
}
