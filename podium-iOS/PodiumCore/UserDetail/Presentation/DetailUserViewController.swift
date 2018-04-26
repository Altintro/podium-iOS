//
//  DetailUserViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

protocol DetailUserViewControllerProvider: class {
    func detailUserViewController(identifier: String) -> UIViewController
}

class DetailUserViewController: UIViewController, CustomNavigationButtonsView {
    
    @IBOutlet weak var stackView: UIStackView!
    
    private let presenter: DetailUserPresenter
    private let headerPresenter: DetailUserHeaderPresenter
    private let sportsPresenter: ThumbPresenter
    private let gamesPresenter: StripPresenter
    
    init(presenter: DetailUserPresenter, headerPresenter: DetailUserHeaderPresenter, sportsPresenter: ThumbPresenter, gamesPresenter: StripPresenter){
        self.presenter = presenter
        self.headerPresenter = headerPresenter
        self.sportsPresenter = sportsPresenter
        self.gamesPresenter = gamesPresenter
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        if(presenter.userType == .other){
            configureBackButton()
        }
        presenter.view = self
        presenter .didLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.didAppear()
    }

}

extension DetailUserViewController: DetailUserView{
    func update(with sections: [DetailUserSection]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        sections.forEach { addView(for: $0) }
    }
}

extension DetailUserViewController {
    func addView(for section: DetailUserSection){
        let view: UIView
        
        switch section {
        case .header(let header):
            view = headerView(with: header)
        case .thumbView(let title, let items):
            view = sportsView(withTitle: title, items: items)
        case .gamesPlaying(let title, let items):
            view = gamesView(withTitle: title, items: items)
        }
        
        stackView.addArrangedSubview(view)
    }
    
    func headerView(with header: DetailUserHeader) -> UIView {
        let headerView = DetailUserHeaderView.instantiate()
        headerPresenter.present(header: header, in: headerView)
        
        return headerView
    }
    
    func sportsView(withTitle title: String, items: [ThumbItem]) -> UIView {
        let sportsView = ThumbView.instantiate()
        sportsView.presenter = sportsPresenter
        sportsView.title = title
        sportsView.items = items
        return sportsView
    }
    
    func gamesView(withTitle title: String, items: [StripItem]) -> UIView {
        let gamesView = StripView.instantiate()
        gamesView.presenter = gamesPresenter
        gamesView.items = items
        gamesView.itemSelected
            .subscribe(onNext: {[weak self] item in
                self?.presenter.gameTapped(withIdentifier: item.identifier)
            })
            .disposed(by: gamesView.disposeBag)
        return gamesView
    }
}
