//
//  EmailNewUserPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol RegisterView : class {
    var title: String? { get set }
    func update(with sections: [RegisterSection])
    func updateSection(with sports: [Sport])
    func dismissAll()
}


final class RegisterPresenter {
    private let repository: AuthenticationRepositoryProtocol
    private let magicLinkNavigator: MagicLinkNavigator
    private let registerType: RegisterType
    let disposeBag = DisposeBag()
    
    weak var view: RegisterView?
    
    init(repository: AuthenticationRepositoryProtocol, magicLinkNavigator: MagicLinkNavigator, type: RegisterType){
        self.repository = repository
        self.magicLinkNavigator = magicLinkNavigator
        self.registerType = type
    }
    
    func didLoad() {
        self.view?.update(with: self.registerSections())
        loadSports()
    }
    
    func loadSports() {
        repository.sports()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] response in
                guard let `self` = self else {
                    return
                }
                self.view?.updateSection(with: response.result)
                }, onError: { error in
                    print("Email downloading sports")
                }, onDisposed: { [weak self] in
                    print("onDisposed")
                })
            .disposed(by: disposeBag)
    }
    
    private func registerSections() -> [RegisterSection] {
        var registerSections : [RegisterSection] = [
            .field(type: .alias),
            .sports(title: NSLocalizedString("What sports do you practice?", comment: ""), items:[]),
            .submit(title: "Sign up!")
        ]
        if registerType == .email{
            registerSections.insert(.field(type: .name), at: 0)
        }
        return registerSections
    }
    
    func submit(withUserData data: [String : String], sports: String) {
        switch registerType {
        case .email:
            emailRegisterRequest(with: data, sports: sports)
        case .social:
            socialRegisterRequest(with: data, sports: sports)
        }
        
    }
    
    private func emailRegisterRequest(with userData: [String:String], sports: String) {
        repository.emailRegister(user: userData, sports: sports)
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
    
    private func socialRegisterRequest(with userData: [String: String] , sports: String) {
            repository.socialRegister(alias: userData["alias"]!, sports: sports)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: {[weak self] response in
                    guard let `self` = self else {
                        return
                    }
                    self.view?.dismissAll()
                    }, onError: { error in
                        print("Email register error: \(error)")
                }, onDisposed: { [weak self] in
                    print("onDisposed")
                })
                .disposed(by: disposeBag)
    }
    
    
}
