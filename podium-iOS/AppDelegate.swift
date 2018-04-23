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
        
        let homeInitialViewController = appAssembly.coreAssembly.homeAssembly.viewController()
        appAssembly.homeNavigationController.pushViewController(homeInitialViewController, animated: false)
        
        let profileInitialViewController = UIViewController()
        profileInitialViewController.view?.backgroundColor = .blue
        appAssembly.profileNavigationController.pushViewController(profileInitialViewController, animated: false)
        
        let createInitialViewController = appAssembly.coreAssembly.createGameAssembly.viewController()
        appAssembly.createNavigationController.pushViewController(createInitialViewController,animated: false)
        
        appAssembly.tabBarController.setViewControllers([
            appAssembly.homeNavigationController,
            appAssembly.createNavigationController,
            appAssembly.profileNavigationController],
                                    animated: true)
        
        
        appAssembly.window.rootViewController = appAssembly.tabBarController
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
        UserDefaults.standard.set(token, forKey:"access-token")
        // ☝🏼this token should expire shortly, the me() request should return another valid token, then save it 👇🏽
        appAssembly.coreAssembly.authenticationAssembbly.authenticationRepository().tokens()
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: {  [weak self] response in
                    guard let `self` = self else {
                        return
                    }
                    if(response.auth){
                        UserDefaults.standard.set(response.accessToken, forKey: "access-token")
                        UserDefaults.standard.set(response.refreshToken, forKey: "refresh-token")
                        self.appAssembly.coreAssembly.authenticationAssembbly.navigationController.dismiss(animated: true, completion: nil)
                    }
                }, onError: { error in
                    print(error)
                }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: appAssembly.disposeBag)
        return true
    }
    
    
    
    private func configureFirebase() {
        FirebaseApp.configure()
    }
}
