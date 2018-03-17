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

class AuthenticationViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var googleButton: UIView!
    @IBOutlet weak var facebookButton: UIView!
    @IBOutlet weak var emailButton: UIView!
    @IBOutlet weak var signInButton: UILabel!
    
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
        configureGoogle()
        configureFaceBook()
        configureViews()
    }
    
    func configureViews() {
        let SignUpbuttons = [googleButton: #selector(self.googleSignUp(tap:)),
                       facebookButton: #selector(facebookSignUp(tap:)),
                       emailButton: #selector(emailSignUp(tap:))]
        SignUpbuttons.forEach {
            $0.layer.borderWidth = 1.0
            $0.layer.cornerRadius = 5.0
            $0.layer.borderColor = UIColor.darkGray.cgColor
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                            action: $1))
        }
        
        signInButton.addGestureRecognizer( UITapGestureRecognizer(target: self,
                                                                  action: #selector(signIn(tap:))))
    }
    
    func configureGoogle() {
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    func configureFaceBook() {
        // Configure FB Delegates or others
    }
    
    @objc func googleSignUp(tap: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @objc func facebookSignUp(tap: UITapGestureRecognizer) {
        // Facebook Sign up
    }
    
    @objc func emailSignUp(tap: UITapGestureRecognizer) {
        presenter.userWantsToSignUpWithEmail()
    }
    
    @objc func signIn(tap: UITapGestureRecognizer) {
        presenter.userAlreadyHasAnAccount()
    }
}

extension AuthenticationViewController: AuthenticationView {
    
}

extension AuthenticationViewController: GIDSignInUIDelegate {
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
       // Stop animating activity indicator
    }

    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}

