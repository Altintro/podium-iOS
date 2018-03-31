//
//  MagicLinkViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 28/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol MagicLinkViewControllerProvider: class {
    func magicLinkViewController() -> UIViewController
}

class MagicLinkViewController: UIViewController {

    private let presenter: MagicLinkPresenter
    
    init(presenter: MagicLinkPresenter){
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

extension MagicLinkViewController: MagicLinkView {
    // Protocol stubs
}
