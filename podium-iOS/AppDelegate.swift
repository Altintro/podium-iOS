//
//  AppDelegate.swift
//  podium-iOS
//
//  Created by Fernando Frances on 01/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let initialViewController = appAssembly.coreAssembly.authenticationAssembbly.viewController()
        appAssembly.window.rootViewController = initialViewController
        // Init with navigation
        // appAssembly.window.rootViewController = appAssembly.navigationController
        // appAssembly.navigationController.pushViewController(initialViewController, animated: false)
        appAssembly.window.makeKeyAndVisible()
      
        configureGoogleSignIn(delegate: self)
        configureFirebase()

        return true
    }
    
    
    private func configureGoogleSignIn(delegate: GIDSignInDelegate) -> Void {
        GIDSignIn.sharedInstance().clientID = Bundle(for: AppDelegate.self).infoDictionary!["GOOGLE_CLIENT_ID"] as? String ?? ""
        GIDSignIn.sharedInstance().delegate = delegate;
    }
    
    private func configureFirebase() {
        FirebaseApp.configure()
    }

}

extension AppDelegate: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
           print("signed in")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("disconnect")
    }

}

