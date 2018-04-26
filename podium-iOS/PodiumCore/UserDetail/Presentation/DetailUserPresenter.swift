//
//  DetailUserPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailUserView : class {
    func update(with sections: [DetailUserSection])
}

final class DetailUserPresenter {
    
    private let repository: DetailUserRepositoryProtocol
    private let identifier: String?
    private let disposeBag = DisposeBag()
    let userType: UserType
    
    weak var view: DetailUserView?
    
    init(repository: DetailUserRepositoryProtocol, identifier: String?, userType: UserType){
        self.repository = repository
        self.identifier = identifier ?? ""
        self.userType = userType
    }
    
    func didLoad() {

    }
    
    func didAppear() {
        loadContents()
    }
    
    func gameTapped(withIdentifier identifier: String){
        // Navigate to detail game
    }
}

private extension DetailUserPresenter {
    func loadContents() {
        switch userType {
        case .me:
            getUserOwnerDetail()
        case .other:
            getOtherUserDetail()
        }
        
    }
    
    func getOtherUserDetail(){
        repository.user(withIdentifier: identifier!)
            .map { [weak self] response in
                self?.detailUserSections(for: response.result) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                }, onError: { error in
                    print("Error getting user detail")
            }, onDisposed: { [weak self] in
                print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
    func getUserOwnerDetail() {
        repository.me()
            .map { [weak self] response in
                self?.detailUserSections(for: response.result) ?? []
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] sections in
                self?.view?.update(with: sections)
                }, onError: { error in
                    print("Error getting my user detail")
            }, onDisposed: { [weak self] in
                print("onDisposed")
            })
            .disposed(by: disposeBag)
    }
    
    func detailUserSections(for user: User) -> [DetailUserSection] {
        var detailSections: [DetailUserSection] = [
            .header(DetailUserHeader(user: user))
        ]
        
        let sports = user.interests?.map { ThumbItem(sport: $0)}
        if let sports = sports {
             detailSections.append(.thumbView(title: NSLocalizedString("Participating", comment: ""), items: sports))
        }
       
        let gamesPlaying = user.gamesPlaying?.map { StripItem(game: $0)}
        if let gamesPlaying = gamesPlaying {
            detailSections.append(.gamesPlaying(title: NSLocalizedString("Games Playing", comment: ""), items: gamesPlaying))
        }
        
        return detailSections
    }
}
