//
//  ChooseSportViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class ChooseSportViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: Properties
    private let presenter: ChooseSportPresenter
    private let sportsPresenter: SportsPresenter
    
    weak var delegate: CreateSectionDelegate?
    
    init(presenter: ChooseSportPresenter, sportsPresenter: SportsPresenter) {
        self.presenter = presenter
        self.sportsPresenter = sportsPresenter
        
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
    func update(with sports: [Sport]) {
        let sportsCollectionView = sportsView(withTitle: "", items: sports)
        stackView.addArrangedSubview(sportsCollectionView)
    }
}

extension ChooseSportViewController {
    func sportsView(withTitle title: String, items: [Sport]) -> UIView {
        let sportsView = SportsView.instantiate()
        sportsView.presenter = sportsPresenter
        sportsView.title = title
        sportsView.items = items
        sportsView.itemSelected
            .subscribe(onNext: {[weak self] item in
                self?.delegate?.showNext(current: .sport)
            })
            .disposed(by: sportsView.disposeBag)
        
        return sportsView
    }
}
