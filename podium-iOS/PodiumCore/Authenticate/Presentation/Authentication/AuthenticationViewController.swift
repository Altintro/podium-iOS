//
//  AuthenticationViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift
import GoogleSignIn
import FacebookLogin
import FacebookCore


protocol AuthenticationViewControllerProvider: class {
    func authenticationViewController() -> UIViewController
}

class AuthenticationViewController: UIViewController, CustomNavigationButtonsView {
    
    // MARK: Outlets
    @IBOutlet weak var googleButton: UIView!
    @IBOutlet weak var facebookButton: UIView!
    @IBOutlet weak var emailButton: UIView!
    
    // MARK: Properties
    
    private let presenter: AuthenticationPresenter
    
    // MARK: Initialization
    
    init(presenter: AuthenticationPresenter){
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.didLoad()
        configureCloseButton()
        configureGoogle()
        configureViews()
    }
    
    private func configureViews() {
        self.navigationController?.isNavigationBarHidden = true
        let signUpbuttons = [
            googleButton: #selector(self.google(tap:)),
            facebookButton: #selector(facebook(tap:)),
            emailButton: #selector(email(tap:))]
        signUpbuttons.forEach {
            $0.layer.cornerRadius = 5.0
            $0.addShadow()
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                            action: $1))}
    }
    
    private func configureGoogle() {
        GIDSignIn.sharedInstance().uiDelegate = presenter
    }
    
    @objc func google(tap: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @objc func facebook(tap: UITapGestureRecognizer) {
        let loginManager = LoginManager()

        loginManager.logIn(readPermissions: [.publicProfile, .email, .userBirthday], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let err):
                print(err)
            case .cancelled:
                print("User cancelled facebook login")
            case .success(_, _, let token):
                self.presenter.facebookConnect(token: token.authenticationToken)
            }
        }
        
    }
    
    @objc func email(tap: UITapGestureRecognizer) {
        presenter.emailConnect()
    }
    
    // DUMMY: To sign in and out with same google email
    @IBAction func dummySignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
    
}

extension AuthenticationViewController: AuthenticationView {
    func dismiss() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}

