//
//  CreateGameAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import UIKit

final public class CreateGameAssembly {
    
    private let webServiceAssembly: WebServiceAssembly
    private let tabBarController: UITabBarController
    
    init(webServiceAssembly: WebServiceAssembly, tabBarController: UITabBarController){
        self.webServiceAssembly = webServiceAssembly
        self.tabBarController = tabBarController
    }
    
    private func viewController() -> CreateGameViewController {
        return CreateGameViewController(presenter: presenter(),
                                        chooseSportPresenter: chooseSportPresenter(),
                                        sportsPresenter: sportsPresenter(),
                                        invitesPresenter: invitesPresenter(),
                                        chooseMetadataPresenter: chooseMetadataPresenter(),
                                        finishPresenter: finishPresenter())
    }

    private func presenter() -> CreateGamePresenter {
        return CreateGamePresenter(repository: repository())
    }
    
    private func chooseSportPresenter() -> ChooseSportPresenter {
        return ChooseSportPresenter(repository: repository())
    }
    
    private func sportsPresenter() -> SportsPresenter {
        return SportsPresenter()
    }
    
    private func invitesPresenter() -> InvitesPresenter {
        return InvitesPresenter(repository: repository())
    }
    
    private func chooseMetadataPresenter() -> ChooseMetadataPresenter {
        return ChooseMetadataPresenter()
    }
    
    private func finishPresenter() -> FinishPresenter {
        return FinishPresenter()
    }
    
    private func repository() -> CreateGameRepository {
        return CreateGameRepository(webService: webServiceAssembly.webService)
    }
    
    func navigator() -> CreateGameNavigator {
        return CreateGameNavigator(viewControllerProvider: self,
                                   tabBarController: tabBarController)
    }
}

extension CreateGameAssembly: CreateGameViewControllerProvider {
    func createGameViewController() -> UIViewController {
        return viewController()
    }
    
    
}
