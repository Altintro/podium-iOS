//
//  DetailUserAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final public class DetailUserAssembly {
    
    private let navigationController: UINavigationController
    private let webServiceAssembly: WebServiceAssembly
    
    init(webServiceAssembly: WebServiceAssembly,
         navigationController: UINavigationController) {
        self.webServiceAssembly = webServiceAssembly
        self.navigationController = navigationController
    }
    
    public func viewController() -> DetailUserViewController {
        return DetailUserViewController(presenter: presenter(), headerPresenter: headerPresenter(), sportsPresenter: sportsPresenter(), gamesPresenter: gamesPresenter())
    }
    
    func presenter() -> DetailUserPresenter {
        return DetailUserPresenter(repository: repository())
    }
    
    func repository() -> DetailUserRepository {
        return DetailUserRepository(webService: webServiceAssembly.webService)
    }
    
    func headerPresenter() -> DetailUserHeaderPresenter {
        return DetailUserHeaderPresenter()
    }
    
    func sportsPresenter() -> ThumbPresenter {
        return ThumbPresenter()
    }
    
    func gamesPresenter() -> StripPresenter {
        return StripPresenter()
    }
    
    
}
