//
//  ChooseSportViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class ChooseSportViewController: UIViewController {
    
    private var presenter: ChooseSportPresenter
    
    
    init(presenter: ChooseSportPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        presenter.view = self
        presenter.didLoad()
    }

   

}

extension ChooseSportViewController: ChooseSportView {
    
}
