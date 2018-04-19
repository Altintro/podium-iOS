//
//  EmailViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxGesture
import RxSwift

protocol EmailViewControllerProvider: class {
    func emailViewController() -> UIViewController
}

class EmailViewController: UIViewController, CustomNavigationButtonsView {

    // Mark: Outlets
    @IBOutlet weak var checkEmalButton: UIView!
    @IBOutlet weak var emailField: UITextField!
    
    // Mark: Properties
    
    private let presenter: EmailPresenter
    private let disposeBag = DisposeBag()
    
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
        configureBackButton()
        configureViews()
        configureGestures()
    }
    
    private func configureViews() {
        emailField.becomeFirstResponder()
        checkEmalButton.layer.cornerRadius = 5
        checkEmalButton.addShadow()
    }
    
    private func configureGestures() {
        checkEmalButton.rx.tapGesture()
            .when(.recognized)
            .subscribe(onNext: { _ in
                self.presenter
                    .didTapCheckEmail(email: self.emailField.text!)
            })
            .disposed(by: disposeBag)
    }
}

extension EmailViewController: EmailView {

}









