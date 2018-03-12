//
//  CoreAssembly.swift
//  podium-iOS
//
//  Created by Fernando Frances on 09/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

final public class CoreAssembly {
    private(set) lazy var webServiceAssembly = WebServiceAssembly()
    
    private let navigationController: UINavigationController
    
    public func dummyViewController() -> UIViewController {
        let vc = UIViewController()
        vc.view = UIView(frame: UIScreen.main.bounds)
        vc.view.backgroundColor = UIColor.blue
        return vc
        
    }
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
