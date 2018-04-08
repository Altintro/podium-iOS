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
    
    func loadContents() {
        
        let futbol = Sport(_id: "1", name: "Fubtol", image: "nada", description: "Deporte con 2 arcos y una pelota", ranking: nil, rules: "Un referi", popularity: 9, activeTournaments: nil, openTournaments: nil, activeGames: nil, openGames: nil)
        
        let tennis = Sport(_id: "2", name: "Tennis", image: "nada", description: "Raqueta y red", ranking: nil, rules: "Hay que pasar la pelota del otro la de la red", popularity: 7, activeTournaments: nil, openTournaments: nil, activeGames: nil, openGames: nil)
        
        let myUser = User(_id: "1", name: "Tomás", alias: "Tom", email: "moyanotomasi@gmail.com", profilePic: "nada", gender: "male", birthdate: "123123213", latitude: nil, longitude: nil, interests: [futbol, tennis], emblems: nil, tournamentsPlayed: nil, tournamentsPlaying: nil, tournamentsWon: nil, tournamentsUpcoming: nil, gamesPlayed: nil, gamesPlaying: nil, gamesWon: nil, gamesUpcoming: nil, ranking: nil, fb: nil, google: nil, hasPassword: true, mergedWithFB: false, mergedWithGoogle: false)
        
        let team = Team(id: "1", players: [myUser], name: "River Plate", image: nil, description: "El mas grande")
        
        let game1 = Game(_id: "1", name: "Futbol 11", sport: futbol, description: "Partida de futbol 11 contra 11", tournament: nil, participants: [team], wins: nil, loses: nil, concluded: false, open: true, date: "1524996000", latitude: nil, longitude: nil, modality: .team, levelAverage: .advanced)
        
        let game2 = Game(_id: "2", name: "Tennis 2 v 2", sport: tennis, description: "Partida de tennis 2 contra 2", tournament: nil, participants: [team], wins: nil, loses: nil, concluded: false, open: true, date: "1524997200", latitude: nil, longitude: nil, modality: .team, levelAverage: .talented)
        
        let game3 = Game(_id: "1", name: "Futbol 11", sport: futbol, description: "Partida de futbol 11 contra 11", tournament: nil, participants: [team], wins: nil, loses: nil, concluded: false, open: true, date: "1524996000", latitude: nil, longitude: nil, modality: .team, levelAverage: .advanced)
        
        let game4 = Game(_id: "2", name: "Tennis 2 v 2", sport: tennis, description: "Partida de tennis 2 contra 2", tournament: nil, participants: [team], wins: nil, loses: nil, concluded: false, open: true, date: "1524997200", latitude: nil, longitude: nil, modality: .team, levelAverage: .talented)
        
        
        let pingPong = Sport(_id: "3", name: "Ping Pong", image: "nada", description: "Deporte con dos paletas y una pequeña red", ranking: nil, rules: "Hay que pasar la pelota en del otro lado de la red en la mesa pequeña", popularity: 4, activeTournaments: nil, openTournaments: nil, activeGames: nil, openGames: nil)
        
        let games = [game1,game2, game3, game4]
        let sports = [futbol,tennis, pingPong]
        
        let sections = self.homeSections(games: games, sports: sports)
        self.view?.update(with: sections)
        
        /*let featuredGames = repository.featuredGames().map { $0.result }
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
            .disposed(by: disposeBag)*/
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
