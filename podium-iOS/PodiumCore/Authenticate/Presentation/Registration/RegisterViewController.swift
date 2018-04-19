//
//  RegisterViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxGesture
import RxSwift

protocol RegisterViewControllerProvider: class {
    func registerViewController(registerType: RegisterType, email: String) -> UIViewController
}

class RegisterViewController: UIViewController, CustomNavigationButtonsView {
    
    // MARK: - Outlets

    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Properties
    
    private let presenter: RegisterPresenter
    private let sportsPresenter: SportsPresenter
    private let disposeBag = DisposeBag()
    private let email: String
    
    // MARK: - Initialization
    
    init(presenter: RegisterPresenter, sportsPresenter: SportsPresenter, email: String) {
        self.presenter = presenter
        self.sportsPresenter = sportsPresenter
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
        configureBackButton()
    }
}

extension RegisterViewController: RegisterView {
    func update(with sections: [RegisterSection]) {
        sections.forEach { addView(for: $0) }
    }
    
    func updateSection(with sports: [Sport]) {
        stackView.arrangedSubviews.forEach {
            if ($0.isKind(of: SportsView.self)){
                let sportsView = $0 as! SportsView
                sportsView.items = sports
            }
        }
    }
}

private extension RegisterViewController {
    func addView(for section: RegisterSection){
        let view: UIView
        
        switch section {
        case .field(let type):
            view = fieldView(withType: type)
        case .sports(let title, let items):
            view = sportsView(withTitle: title, items: items)
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
    
    func sportsView(withTitle title: String, items: [Sport]) -> UIView {
        let sportsView = SportsView.instantiate()
        sportsView.presenter = sportsPresenter
        sportsView.title = title
        sportsView.items = items
        sportsView.itemSelected
            .subscribe(onNext: {[weak self] item in
               print("sport selected")
            })
            .disposed(by: sportsView.disposeBag)
        
        return sportsView
    }
    
    func submitView(withTitle title: String) -> UIView {
        let submit = SubmitView.instantiate()
        submit.submitButton.setTitle(title, for: .normal)
        submit.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                self.submit()
            })
            .disposed(by: disposeBag)
        return submit
    }
    
    private func submit () {
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
