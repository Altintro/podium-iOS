//
//  RegisterViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol RegisterViewControllerProvider: class {
    func registerViewController(registerType: RegisterType) -> UIViewController
}

class RegisterViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    
    private let presenter: RegisterPresenter
    
    // MARK: - Initialization
    
    init(presenter: RegisterPresenter) {
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
            view = fieldView(withTitle: type.rawValue)
        case .sports:
            view = UIView()
        }
        
        stackView.addArrangedSubview(view)
    }
    
    func fieldView(withTitle title: String) -> UIView {
        let field = FieldView.instantiate()
        field.titleLabel.text = title
        
        return field
    }
}
