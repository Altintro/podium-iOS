//
//  AuthenticationViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift
import RxGesture
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
    private let disposeBag = DisposeBag()
    
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
        configureGestures()
    }
    
    private func configureViews() {
        self.navigationController?.isNavigationBarHidden = true
        let signUpbuttons = [ googleButton, facebookButton, emailButton ]
        signUpbuttons.forEach {
            $0?.layer.cornerRadius = 5.0
            $0?.addShadow()
        }
    }
    
    private func configureGoogle() {
        GIDSignIn.sharedInstance().uiDelegate = presenter
    }
    
    private func configureGestures() {
        googleButton.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                GIDSignIn.sharedInstance().signIn()
            })
            .disposed(by: disposeBag)
        
        facebookButton.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                self.facebookSignIn()
            })
            .disposed(by: disposeBag)
        
        emailButton.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                self.presenter.emailConnect()
            })
            .disposed(by: disposeBag)
    }
    
    private func facebookSignIn() {
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

