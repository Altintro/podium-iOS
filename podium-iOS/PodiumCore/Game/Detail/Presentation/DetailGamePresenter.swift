//
//  DetailGamePresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailGameView: class {
    func update(with game: Game)
}

final class DetailGamePresenter {
    
    private let repository: DetailGameRepositoryProtocol
    private let disposeBag = DisposeBag()
    weak var view: DetailGameView?
    
    
    init(repository: DetailGameRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad() {
        loadContents()
    }
    
    func loadContents() {
        repository.game(withIdentifier: "dummyId")
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] response in
                guard let `self` = self else {
                    return
                }
                self.view?.update(with: response.result)
                }, onError: { error in
                    print("Error posting game")
            }, onDisposed: { [weak self] in
                print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
}
