//
//  AppDelegate.swift
//  podium-iOS
//
//  Created by Fernando Frances on 01/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let initialViewController = appAssembly.coreAssembly.authenticationAssembbly.viewController()
        appAssembly.window.rootViewController = appAssembly.navigationController
        appAssembly.navigationController.pushViewController(initialViewController, animated: false)
        appAssembly.window.makeKeyAndVisible()
    
        configureFirebase()

        return true
    }
    
    // Handle Universal links
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {

        let comps = URLComponents(url: userActivity.webpageURL!,
                                  resolvingAgainstBaseURL: false)
        var queryParams = [String: String] ()
        comps?.queryItems?.forEach { queryParams[$0.name] = $0.value }
        
        // Create AppDelegate repository worker, to call /me and realad contents, then pop to the root of the app.
        appAssembly.navigationController.popToRootViewController(animated: true)
        
        return true
    }
    
    private func configureFirebase() {
        FirebaseApp.configure()
    }

}
