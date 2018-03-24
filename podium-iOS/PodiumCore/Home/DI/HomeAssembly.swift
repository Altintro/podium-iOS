//
//  HomeAssembly.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final public class HomeAssembly {
    
    init() {
        
    }
    
    public func viewController() -> UIViewController {
        return HomeViewController(presenter: presenter())
    }
    
    func presenter() -> HomePresenter {
        return HomePresenter()
    }
}
