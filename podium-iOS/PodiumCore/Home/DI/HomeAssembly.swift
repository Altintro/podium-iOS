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
        return HomeViewController(presenter: presenter(), eventsPresenter: eventsPresenter(), sportsPresenter: sportsPresenter())
    }
    
    func presenter() -> HomePresenter {
        return HomePresenter(repository: homeRepository())
    }
    
    func eventsPresenter() -> EventsPresenter {
        return EventsPresenter()
    }
    
    func sportsPresenter() -> SportsPresenter {
        return SportsPresenter()
    }
    
    func homeRepository() -> HomeRepositoryProtocol {
        return HomeRespository(webService: webServiceAssembly.webService)
    }
}
