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
    private let authenticationAssembly: AuthenticationAssembbly
    private let detailGameAssembly: DetailGameAssembly
    
    init(webServiceAssembly: WebServiceAssembly,
         authenticationAssembly: AuthenticationAssembbly,
         detailGameAssembly: DetailGameAssembly) {
        self.webServiceAssembly = webServiceAssembly
        self.authenticationAssembly = authenticationAssembly
        self.detailGameAssembly = detailGameAssembly
    }
    
    public func viewController() -> UIViewController {
        return HomeViewController(presenter: presenter(), stripPresenter: stripPresenter())
    }
    
    func presenter() -> HomePresenter {
        return HomePresenter(repository: repository(),
                             authenticationNavigator: authenticationAssembly.authenticationNavigator(),
                             detailGameNavigator: detailGameAssembly.navigator())
    }
    
    func stripPresenter() -> StripPresenter {
        return StripPresenter()
    }
    
    func repository() -> HomeRepositoryProtocol {
        return HomeRespository(webService: webServiceAssembly.webService)
    }
    
}


