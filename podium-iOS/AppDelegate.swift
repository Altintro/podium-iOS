//
//  AppDelegate.swift
//  podium-iOS
//
//  Created by Fernando Frances on 01/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let initialViewController = appAssembly.coreAssembly.dummyViewController()
        
        appAssembly.window.rootViewController = appAssembly.navigationController
        appAssembly.navigationController.pushViewController(initialViewController, animated: false)
        appAssembly.window.makeKeyAndVisible()
        
        return true
    }


}

