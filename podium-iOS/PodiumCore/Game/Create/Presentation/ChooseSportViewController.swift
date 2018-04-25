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
    let presenter: ChooseSportPresenter
    private let sportsPresenter: ThumbPresenter
    
    weak var delegate: CreateSectionDelegate?
    
    init(presenter: ChooseSportPresenter, sportsPresenter: ThumbPresenter) {
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
    func update(with items: [ThumbItem]) {
        let sportsCollectionView = sportsView(withTitle: "", items: items)
        stackView.addArrangedSubview(sportsCollectionView)
    }
}

extension ChooseSportViewController {
    func sportsView(withTitle title: String, items: [ThumbItem]) -> UIView {
        let sportsView = ThumbView.instantiate()
        sportsView.presenter = sportsPresenter
        sportsView.title = title
        sportsView.items = items
        sportsView.itemSelected
            .subscribe(onNext: {[weak self] item in
                self?.presenter.showNext(data: ["sport": item.identifier])
            })
            .disposed(by: sportsView.disposeBag)
        
        return sportsView
    }
}
