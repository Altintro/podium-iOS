//
//  HomePresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 02/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

//
//  HomePresenter.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift

protocol HomeView: class {
    
    var title: String? { get set }
    
    func update(with sections: [HomeSection])
}

final class HomePresenter {
    
    private let repository: HomeRepositoryProtocol
    private let disposeBag = DisposeBag()
    
    weak var view: HomeView?
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func didLoad() {
        
        view?.title = NSLocalizedString("Home", comment: "")
        loadContents()
    }
}

private extension HomePresenter {
    
    
    func loadSports() -> [Sport] {
        
        let futbol = Sport(_id: "1", name: "Fubtol", image: "nada", description: "Deporte con 2 arcos y una pelota", ranking: nil, rules: "Un referi", popularity: 9, activeTournaments: nil, openTournaments: nil, activeGames: nil, openGames: nil)
        
        let tennis = Sport(_id: "2", name: "Tennis", image: "nada", description: "Raqueta y red", ranking: nil, rules: "Hay que pasar la pelota del otro la de la red", popularity: 7, activeTournaments: nil, openTournaments: nil, activeGames: nil, openGames: nil)
        
        let pingPong = Sport(_id: "3", name: "Ping Pong", image: "nada", description: "Deporte con dos paletas y una pequeña red", ranking: nil, rules: "Hay que pasar la pelota en del otro lado de la red en la mesa pequeña", popularity: 4, activeTournaments: nil, openTournaments: nil, activeGames: nil, openGames: nil)
        
        return [futbol,tennis, pingPong]
    }
    
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
        //Pass sports too in this function 👆
        let sportItems = sports.map { StripItem(sport: $0) }
        homeSections.append(.strip(title: NSLocalizedString("Popular Sports", comment: ""), items: sportItems))
        return homeSections
    }
    
}
