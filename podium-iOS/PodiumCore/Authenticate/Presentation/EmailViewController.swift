//
//  EmailViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol EmailViewControllerProvider: class {
    func emailViewController() -> UIViewController
}

class EmailViewController: UIViewController {

    // Mark: Outlets
    @IBOutlet weak var checkEmalButton: UIView!
    @IBOutlet weak var emailField: UITextField!
    
    // Mark: Properties
    
    private let presenter: EmailPresenter
    
    // Mark: Initialization
    
    init(presenter: EmailPresenter){
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
        configureViews()
    }
    
    private func configureViews() {
        emailField.becomeFirstResponder()
        checkEmalButton.layer.borderWidth = 1.0
        checkEmalButton.layer.cornerRadius = 5.0
        checkEmalButton.layer.borderColor = UIColor.darkGray.cgColor
        checkEmalButton.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                    action: #selector(checkEmailAndContinue(tap:))))
    }
    
    @objc func checkEmailAndContinue(tap: UITapGestureRecognizer) {
            presenter.didTapCheckEmail(email: emailField.text!)
    }
}

extension EmailViewController: EmailView {
    
    func showNext(userAlreadyExists: Bool) {
        
    }
    
}









