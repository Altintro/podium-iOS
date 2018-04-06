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
    
    // Mark: Outlets
    
    @IBOutlet weak var backButton: UIImageView!
    
    // Mark: Properties
    
    private let presenter: MagicLinkPresenter
    
    // Mark: Initialization
    
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
        configureViews()
    }
    
    func configureViews() {
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                               action: #selector(pop)))
    }
    
}

extension MagicLinkViewController: MagicLinkView {
    
    @objc func pop() {
        navigationController?.popViewController(animated: true)
    }
}
