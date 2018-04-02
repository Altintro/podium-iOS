//
//  HomeAssembly.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final public class HomeAssembly {
    
    private let webServiceAssembly: WebServiceAssembly
    
    init(webServiceAssembly: WebServiceAssembly) {
        
        self.webServiceAssembly = webServiceAssembly
    }
    
    public func viewController() -> UIViewController {
        return HomeViewController(presenter: presenter(), stripPresenter: stripPresenter())
    }
    
    func presenter() -> HomePresenter {
        return HomePresenter(repository: homeRepository())
    }
    
    func stripPresenter() -> StripPresenter {
        return StripPresenter()
    }
    
    func homeRepository() -> HomeRepositoryProtocol {
        return HomeRespository(webService: webServiceAssembly.webService)
    }
}
