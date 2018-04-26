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
    var dummyCreateGameViewController = UIViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let homeInitialViewController = appAssembly.coreAssembly.homeAssembly.viewController()
        appAssembly.homeNavigationController.pushViewController(homeInitialViewController, animated: false)
        
        let profileInitialViewController = appAssembly.coreAssembly.detailUserAssembly.viewController(userType: .me)
        appAssembly.profileNavigationController.pushViewController(profileInitialViewController, animated: false)
        
        appAssembly.tabBarController.setViewControllers([
            appAssembly.homeNavigationController,
            dummyCreateGameViewController,
            appAssembly.profileNavigationController],
                                    animated: true)
        appAssembly.tabBarController.delegate = self
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
        appAssembly.coreAssembly.authenticationAssembly.authenticationRepository().tokens()
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: {  [weak self] response in
                    guard let `self` = self else {
                        return
                    }
                    if(response.auth){
                        UserDefaults.standard.set(response.accessToken, forKey: "access-token")
                        UserDefaults.standard.set(response.refreshToken, forKey: "refresh-token")
                        self.appAssembly.coreAssembly.authenticationAssembly.navigationController.dismiss(animated: true, completion: nil)
                    }
                }, onError: { error in
                    print(error)
                }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: appAssembly.disposeBag)
        return true
    }

  
}

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == dummyCreateGameViewController {
            if  UserDefaults.standard.string(forKey: "access-token") != nil {
                appAssembly.coreAssembly.createGameAssembly.navigator().showCreateGameViewController()
            } else {
                appAssembly.coreAssembly.authenticationAssembly.authenticationNavigator().showAuthenticationViewController()
            }
            return false
        } else if viewController == appAssembly.profileNavigationController {
            if  UserDefaults.standard.string(forKey: "access-token") != nil {
                return true
            } else {
                appAssembly.coreAssembly.authenticationAssembly.authenticationNavigator().showAuthenticationViewController()
            }
            return true
        } else {
            return true
        }
    }
}

extension AppDelegate {
    private func configureFirebase() {
        FirebaseApp.configure()
    }
}
