//
//  CreateGameViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol CreateGameViewControllerProvider: class {
    func createGameViewController() -> UIViewController
}

class CreateGameViewController: UIViewController {

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    private let presenter: CreateGamePresenter
    private let chooseSportPresenter: ChooseSportPresenter
    private let sportsPresenter: SportsPresenter
    private let invitesPresenter: InvitesPresenter
    private let chooseMetadataPresenter: ChooseMetadataPresenter
    private let finishPresenter: FinishPresenter
    private var pageController = UIPageViewController()
    
    init(presenter: CreateGamePresenter,
         chooseSportPresenter: ChooseSportPresenter,
         sportsPresenter: SportsPresenter,
         invitesPresenter: InvitesPresenter,
         chooseMetadataPresenter: ChooseMetadataPresenter,
         finishPresenter: FinishPresenter) {
        self.presenter = presenter
        self.chooseSportPresenter = chooseSportPresenter
        self.sportsPresenter = sportsPresenter
        self.invitesPresenter = invitesPresenter
        self.finishPresenter = finishPresenter
        self.chooseMetadataPresenter = chooseMetadataPresenter
    
        
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
        selectorViewController.presenter.delegate = presenter
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.setViewControllers([selectorViewController], direction: .forward, animated: false, completion: nil)
        containerView.addSubview(pageController.view)
        pageController.view.frame = containerView.bounds
        
        self.addChildViewController(pageController)
        
        sectionTitle.text = NSLocalizedString("Choose a sport for the game", comment: "")
    }
    
    func nextViewControllerProviderForCurrent(current: CreateGameSection) -> UIViewController{
        switch current  {
        case .sport:
            let next = ChooseMetadataViewController(presenter: chooseMetadataPresenter)
            next.presenter.delegate = presenter
            sectionTitle.text = NSLocalizedString("Give some details to your oponents", comment: "")
            return next
        case .metadata:
            let next = InvitesViewController(presenter: invitesPresenter)
            next.presenter.delegate = presenter
            sectionTitle.text = NSLocalizedString("Invite others to play!", comment: "")
            return next
        case .invite:
            let next = FinishViewController(presenter: finishPresenter)
            next.presenter.delegate = presenter
            sectionTitle.text = NSLocalizedString("Congratulations! the game has been posted successfully", comment: "")
            return next
            
        // To add: modality, datePicker, map...
        }
    }

}


extension CreateGameViewController: CreateGameView {
    
    func showNext(current: CreateGameSection) {
        let next = nextViewControllerProviderForCurrent(current: current)
        pageController.setViewControllers([next as! UIViewController], direction: .forward, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
