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
    private(set) lazy var navigationController = UINavigationController()
    private(set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
    private(set) lazy var disposeBag = DisposeBag()

}


