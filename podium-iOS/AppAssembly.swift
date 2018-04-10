//
//  AppAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 03/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift

final class AppAssembly {
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    
    private(set) lazy var tabBarController = MainTabBarController()
    
    private(set) lazy var profileNavigationController = UINavigationController()
    private(set) lazy var homeNavigationController = UINavigationController()
    private(set) lazy var createNavigationController = UINavigationController()
    
    private(set) lazy var coreAssembly = CoreAssembly(tabBarController: tabBarController)
    
    private(set) lazy var disposeBag = DisposeBag()
    
}




