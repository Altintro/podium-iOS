//
//  HomePresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 02/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol HomeView: class {
    
    var title: String? { get set }
    func update(with sections: [HomeSection])
}

final class HomePresenter {
    
    private let repository: HomeRepositoryProtocol
    private let authenticationNavigator: AuthenticationNavigator
    private let disposeBag = DisposeBag()
    
    weak var view: HomeView?
    
    init(repository: HomeRepositoryProtocol, authenticationNavigator: AuthenticationNavigator) {
        self.repository = repository
        self.authenticationNavigator = authenticationNavigator
    }
    
    func didLoad() {
        
        view?.title = NSLocalizedString("Home", comment: "")
        loadContents()
    }
    
    func gameTapped() {
        // Si el usuario esta registrado, muestro detalle, si no, muestro authentication
        authenticationNavigator.showAuthenticationViewController()
    }
}

private extension HomePresenter {
    
    func loadContents() {
        let featuredGames = repository.featuredGames().map { $0.result }
        let featuredSports = repository.featuredSports().map { $0.result }
        
        Observable.combineLatest(featuredGames,featuredSports) { games, sports in
            return (games,sports)
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] games, sports in
                guard let `self` = self else {
                    return
                }
                let sections = self.homeSections(games: games, sports: sports)
                self.view?.update(with: sections)
                }, onError: { error in
                    print("Error getting featured games/sports: \(error)")
            }, onDisposed: { [weak self] in
                print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
    func homeSections(games: [Game], sports: [Sport]) -> [HomeSection] {
        var homeSections: [HomeSection] = []
        let gameItems = games.map { StripItem(game: $0) }
        homeSections.append(.strip(title: NSLocalizedString("Featured Games", comment: ""), items: gameItems))
        let sportItems = sports.map { StripItem(sport: $0) }
        homeSections.append(.strip(title: NSLocalizedString("Popular Sports", comment: ""), items: sportItems))
        return homeSections
    }
    
}
