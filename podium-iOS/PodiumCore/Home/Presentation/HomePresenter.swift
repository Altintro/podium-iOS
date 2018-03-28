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
    
    func update(with games: [Game])
}

final class HomePresenter {
    
    private let repository: HomeRepositoryProtocol
    private let disposeBag = DisposeBag()
    
    weak var view: HomeView?
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func didLoad() {
        
        view?.title = NSLocalizedString("Games", comment: "")

        loadGames()
        loadGames()
    }
}

private extension HomePresenter {
    
    func loadGames() {
        
        /*let facebook = Facebook(id: "1", name: "Tomás", picture: "nada", email: "tom@as.com")
        let google = Google(id: "1", name: "Tomás", picture: "nada", email: "tom@as.com")
        let myUser = User(id: "1", name: "Tomás Moyano", alias: "Tom", email: "moyanotomasi@gmail.com", profilePic: nil, gender: "male", birthdate: "529191000", latitude: 52.52, longitude: 13.4050, interests: nil, emblems: nil, tournamentsPlayed: nil, tournamentsPlaying: nil, tournamentsWon: nil, tournamentsUpcoming: nil, gamesPlayed: nil, gamesPlaying: nil, gamesWon: nil, gamesUpcoming: nil, ranking: nil, fb: facebook, google: google, hasPassword: true, mergedWithFB: false)
        let futbol = Sport(id: "1", name: "Fubtol", image: "nada", description: "Deporte con 2 arcos y una pelota", ranking: nil, rules: "Un referi", popularity: 9, activeTournaments: nil, openTournaments: nil, activeGames: nil, openGames: nil)
        let team = Team(id: "1", players: [myUser], name: "River Plate", image: nil, description: "El mas grande")
        
        let tennis = Sport(id: "2", name: "Tennis", image: "nada", description: "Raqueta y red", ranking: nil, rules: "Hay que pasar la pelota del otro la de la red", popularity: 7, activeTournaments: nil, openTournaments: nil, activeGames: nil, openGames: nil)
        
        let game1 = Game(id: "1", name: "Futbol 11", sport: futbol, description: "Partida de futbol 11 contra 11", tournament: nil, participants: [team], wins: nil, loses: nil, concluded: false, open: true, date: "1524996000", latitude: nil, longitude: nil, modality: .team, levelAverage: .advanced)
        
        let game2 = Game(id: "2", name: "Tennis 2 v 2", sport: tennis, description: "Partida de tennis 2 contra 2", tournament: nil, participants: [team], wins: nil, loses: nil, concluded: false, open: true, date: "1524997200", latitude: nil, longitude: nil, modality: .team, levelAverage: .talented)
        
        let game3 = Game(id: "1", name: "Futbol 11", sport: futbol, description: "Partida de futbol 11 contra 11", tournament: nil, participants: [team], wins: nil, loses: nil, concluded: false, open: true, date: "1524996000", latitude: nil, longitude: nil, modality: .team, levelAverage: .advanced)
        
        let game4 = Game(id: "2", name: "Tennis 2 v 2", sport: tennis, description: "Partida de tennis 2 contra 2", tournament: nil, participants: [team], wins: nil, loses: nil, concluded: false, open: true, date: "1524997200", latitude: nil, longitude: nil, modality: .team, levelAverage: .talented)
 
        
        let games = [game1,game2, game3, game4]*/
        //self.view?.update(with: games)
        repository.allGames()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[weak self] games in
                
                print("Gamess: \(games)")
                
                }, onError: { error in
                print("Get games Error")
                    
            }, onDisposed: { [weak self] in
                print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
}
