//
//  CreateGameViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol CreateSectionDelegate: NSObjectProtocol {
    func showNext()
}

class CreateGameViewController: UIViewController {

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    private var presenter: CreateGamePresenter
    private var chooseSportPresenter: ChooseSportPresenter
    private var sportsPresenter: SportsPresenter
    private var invitesPresenter: InvitesPresenter
    private var pageController = UIPageViewController()
    
    init(presenter: CreateGamePresenter, chooseSportPresenter: ChooseSportPresenter, sportsPresenter: SportsPresenter, invitesPresenter: InvitesPresenter) {
        self.presenter = presenter
        self.chooseSportPresenter = chooseSportPresenter
        self.sportsPresenter = sportsPresenter
        self.invitesPresenter = invitesPresenter
        
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
        let selectorViewController = ChooseSportViewController(presenter: chooseSportPresenter, sportsPresenter: sportsPresenter)
        selectorViewController.delegate = self
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.setViewControllers([selectorViewController], direction: .forward, animated: false, completion: nil)
        containerView.addSubview(pageController.view)
        pageController.view.frame = containerView.bounds
        
        self.addChildViewController(pageController)
        
    }

}


extension CreateGameViewController: CreateGameView {
    
}

extension CreateGameViewController: CreateSectionDelegate {
    func showNext() {
        let nextViewController = InvitesViewController(presenter: invitesPresenter)
        pageController.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
}
