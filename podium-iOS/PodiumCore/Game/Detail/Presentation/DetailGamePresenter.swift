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
    func update(with sections: [DetailGameSection])
    func reload()
}

final class DetailGamePresenter {
    
    private let repository: DetailGameRepositoryProtocol
    private let authenticationNavigator: AuthenticationNavigator
    private let detailUserNavigator: DetailUserNavigator
    private let dateFormatter: DateFormatter

    private let identifier: String
    weak var view: DetailGameView?
    
    private let disposeBag = DisposeBag()
    
    init(repository: DetailGameRepositoryProtocol, authenticationNavigator: AuthenticationNavigator, detailUserNavigator: DetailUserNavigator, dateFormatter: DateFormatter, identifier: String){
        self.repository = repository
        self.authenticationNavigator = authenticationNavigator
        self.detailUserNavigator = detailUserNavigator
        self.dateFormatter = dateFormatter
        self.identifier = identifier
    }
    
    func didLoad() {
        loadContents()
    }
    
    func joinGame() {
        if (UserDefaults.standard.string(forKey: "access-token") != nil) {
            repository.joinGame(withIdentifier: identifier)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: {[weak self] sections in
                    print("game joined")
                    self?.view?.reload()
                    }, onError: { error in
                        print("Error joining game: \(error)")
                }, onDisposed: { [weak self] in
                    print("onDisposed")
                })
                .disposed(by: disposeBag)
        } else {
            authenticationNavigator.showAuthenticationViewController()
        }
    }
    
    func loadContents() {
        repository.game(withIdentifier: identifier)
            .map { [weak self] response in
                self?.detailSections(for: response.result) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] sections in
                self?.view?.update(with: sections)
            }, onError: { error in
                print("Error getting game detail: \(error)")
            }, onDisposed: { [weak self] in
                print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
    private func detailSections(for game: Game) -> [DetailGameSection] {
        var detailSections: [DetailGameSection] = [
            .header(DetailGameHeader(game: game, dateFormatter: dateFormatter))
        ]
        
        let participants = game.participants?.map { ThumbItem(user: $0) }
        if let participants = participants {
            detailSections.append(.thumView(title: NSLocalizedString("Participants", comment: ""), items: participants))
        }
        
        detailSections.append(.join(title: "Join the game!"))
        
        return detailSections
    }
}
