//
//  CreateGamePresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import RxSwift

protocol CreateGameView: class {
    func showNext(current: CreateGameSection)
    func dismiss()
}

protocol CreateSectionDelegate: class {
    func showNext(current: CreateGameSection, data: [String: String])
    func dismiss()
}

final class CreateGamePresenter {
    
    private let repository: CreateGameRepositoryProtocol
    private let disposeBag = DisposeBag()
    private var gameData = [String: String]()
    
    weak var view: CreateGameView?
    
    init(repository: CreateGameRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad () {
        
    }
    
    private func submit() {
        repository.createGame(with: gameData)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] response in
                guard let `self` = self else {
                    return
                }
                self.view?.showNext(current: .invite)
                }, onError: { error in
                    print("Error posting game")
                }, onDisposed: { [weak self] in
                    print("onDisposed")
                })
            .disposed(by: disposeBag)
    }
}

extension CreateGamePresenter: CreateSectionDelegate {
    
    func showNext(current: CreateGameSection, data: [String : String]) {
        data.forEach { gameData[$0] = $1 }
        print(gameData)
        if (current == .invite){
            self.submit()
        } else {
            self.view?.showNext(current: current)
        }
    }
    
    func dismiss() {
        self.view?.dismiss()
    }
}
