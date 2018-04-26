//
//  ChooseNameViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift

class ChooseMetadataViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var whenTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    let presenter: ChooseMetadataPresenter
    
    init(presenter: ChooseMetadataPresenter){
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

    func configureViews() {
        continueButton.layer.cornerRadius = 5
        continueButton.addShadow()
        continueButton.rx.tap.bind {
            let data = ["name": self.titleTextField.text ?? "",
                        "date": self.whenTextField.text ?? "",
                        "description":self.detailsTextField.text ?? ""]
            self.presenter.showNext(data: data)
        }
    }
}

extension ChooseMetadataViewController: ChooseMetadataView {
    
}
