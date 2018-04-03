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
        configureGoogle()
        configureFaceBook()
        configureViews()
    }
    
    private func configureViews() {
        self.navigationController?.isNavigationBarHidden = true
        let signUpbuttons = [
            googleButton: #selector(self.google(tap:)),
            facebookButton: #selector(facebook(tap:)),
            emailButton: #selector(email(tap:))]
        signUpbuttons.forEach {
            $0.layer.borderWidth = 1.0
            $0.layer.cornerRadius = 5.0
            $0.layer.borderColor = UIColor.darkGray.cgColor
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                            action: $1))}
    }
    
    private func configureGoogle() {
        GIDSignIn.sharedInstance().uiDelegate = presenter
    }
    
    private func configureFaceBook() {
        // Configure FB Delegates or others
    }
    
    @objc func google(tap: UITapGestureRecognizer) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @objc func facebook(tap: UITapGestureRecognizer) {
        // Facebook Sign up
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
    func pop() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

