//
//  AppDelegate.swift
//  podium-iOS
//
//  Created by Fernando Frances on 01/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import Firebase
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let initialViewController = appAssembly.coreAssembly.homeAssembly.viewController()
        let authenticationViewController = appAssembly.coreAssembly.authenticationAssembbly.viewController()
        appAssembly.window.rootViewController = appAssembly.navigationController
        appAssembly.navigationController.pushViewController(initialViewController, animated: false)
        
        //Dummy flow
        appAssembly.navigationController.pushViewController(authenticationViewController, animated: false)
        
        appAssembly.window.makeKeyAndVisible()
    
        configureFirebase()

        return true
    }
    
    // Handle Universal links
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {

        // If we use more than one deeplink, check the path to make difference between urls
        let comps = URLComponents(url: userActivity.webpageURL!,
                                  resolvingAgainstBaseURL: false)
        var queryParams = [String: String] ()
        comps?.queryItems?.forEach { queryParams[$0.name] = $0.value }
        
        let token = queryParams["token"]
        UserDefaults.standard.set(token, forKey:"x-access-token")
        appAssembly.coreAssembly.authenticationAssembbly.authenticationRepository().me()
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: {  [weak self] user in
                    guard let `self` = self else {
                        return
                    }
                    self.appAssembly.navigationController.popToRootViewController(animated: true)
                }, onError: { error in
                    print(error)
                }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: appAssembly.disposeBag)
        appAssembly.navigationController.popToRootViewController(animated: true)
        return true
    }
    
    private func configureFirebase() {
        FirebaseApp.configure()
    }

}
