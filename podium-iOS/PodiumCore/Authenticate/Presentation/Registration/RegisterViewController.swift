//
//  RegisterViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol RegisterViewControllerProvider: class {
    func registerViewController(registerType: RegisterType, email: String) -> UIViewController
}

class RegisterViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Properties
    
    private let presenter: RegisterPresenter
    private let email: String
    
    // MARK: - Initialization
    
    init(presenter: RegisterPresenter, email: String) {
        self.presenter = presenter
        self.email = email
        
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

extension RegisterViewController: RegisterView {
    func update(with sections: [RegisterSection]) {
        sections.forEach { addView(for: $0) }
    }
}

private extension RegisterViewController {
    func addView(for section: RegisterSection){
        let view: UIView
        
        switch section {
        case .field(let type):
            view = fieldView(withType: type)
        case .sports(let title):
            view = sportsView(withTitle: title)
        case .submit(let title):
            view = submitView(withTitle: title)
        }
        
        
        stackView.addArrangedSubview(view)
    }
    
    func fieldView(withType type: FieldType) -> UIView {
        let field = FieldView.instantiate()
        field.type = type
        field.titleLabel.text = "Type in your \(type.rawValue)"
        return field
    }
    
    func sportsView(withTitle title: String) -> UIView {
        let sports = SportsView.instantiate()
        sports.titleLabel.text = title
        
        return sports
    }
    
    func submitView(withTitle title: String) -> UIView {
        let submit = SubmitView.instantiate()
        submit.submitButton.setTitle(title, for: .normal)
        submit.submitButton.addTarget(self, action: #selector(self.submit), for: .touchDown)
        return submit
    }
    
    @objc func submit () {
        var userData = [String: String]()
        stackView.arrangedSubviews.forEach {
            if($0 .isKind(of: FieldView.self)){
                userData[(($0 as! FieldView).type?.rawValue)!] = ($0 as! FieldView).textField.text
            }
        }
        userData["email"] = self.email
        presenter.submit(withUserData: userData)
    }
}
