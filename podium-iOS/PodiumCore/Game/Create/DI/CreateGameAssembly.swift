//
//  CreateGameAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

final public class CreateGameAssembly {
    
    private let webServiceAssembly: WebServiceAssembly
    
    init(webServiceAssembly: WebServiceAssembly){
        self.webServiceAssembly = webServiceAssembly
    }
    
    func viewController() -> CreateGameViewController {
        return CreateGameViewController(presenter: presenter(), chooseSportPresenter: chooseSportPresenter(), sportsPresenter: sportsPresenter(), invitesPresenter: invitesPresenter())
    }

    func presenter() -> CreateGamePresenter {
        return CreateGamePresenter(repository: repository())
    }
    
    func chooseSportPresenter() -> ChooseSportPresenter {
        return ChooseSportPresenter(repository: repository())
    }
    
    func sportsPresenter() -> SportsPresenter {
        return SportsPresenter()
    }
    
    func invitesPresenter() -> InvitesPresenter {
        return InvitesPresenter(repository: repository())
    }
    
    func repository() -> CreateGameRepository {
        return CreateGameRepository(webService: webServiceAssembly.webService)
    }
}
