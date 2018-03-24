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
    func showNext(userAlreadyExists: Bool)
}

final class EmailPresenter {
    private let repository: AuthenticationRepositoryProtocol
    private let disposeBag = DisposeBag()
    
    weak var view: EmailView?
    
    init(repository: AuthenticationRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad() {
        view?.title = NSLocalizedString("Continue with email", comment: "")
    }
    
    func didTapCheckEmail(email: String) {
        repository.checkEmail(email: email)
        .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] check in
                guard let `self` = self else {
                    return
                }
                self.view?.showNext(userAlreadyExists: check.exists)
                }, onError: { error in
                    print("Google Authentication Error")
            }, onDisposed: { [weak self] in
                print("onDisposed")
            })
        .disposed(by: disposeBag)
    }
    
}
