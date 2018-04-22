//
//  CreateGameViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class CreateGameViewController: UIViewController{

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    private var presenter: CreateGamePresenter
    private var pageController = UIPageViewController()
    
    init(presenter: CreateGamePresenter) {
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
        configureInitialView()
    }
    
    func configureInitialView() {
      
    }

}

extension CreateGameViewController: CreateGameView {
    
}
