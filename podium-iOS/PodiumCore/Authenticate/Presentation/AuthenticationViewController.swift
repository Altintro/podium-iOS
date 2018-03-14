//
//  AuthenticationViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

import RxSwift

class AuthenticationViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    // MARK: Actions
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userInfo = ["name": self.nameField.text ?? "",
                       "alias": self.userNameField.text ?? "",
                       "email": self.emailField.text ?? "",
                        "pass": self.passField.text ?? ""]
        presenter.didTapRegister(info: userInfo)
    }
    
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
    }
}

extension AuthenticationViewController: AuthenticationView {
    
}
