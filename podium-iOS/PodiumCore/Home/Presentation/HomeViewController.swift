//
//  HomeViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 02/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let presenter: HomePresenter
    private let stripPresenter: StripPresenter
    
    @IBOutlet weak var stackView: UIStackView!
    
    init(presenter: HomePresenter,
         stripPresenter: StripPresenter) {
        
        self.presenter = presenter
        self.stripPresenter = stripPresenter
        
        super.init(nibName: "HomeViewController", bundle: Bundle(for: type(of: self)))
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

extension HomeViewController: HomeView {
    
    func update(with sections: [HomeSection]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        sections.forEach { addView(for: $0 )}
    }
}

extension HomeViewController {
    func addView(for section: HomeSection) {
        let view: UIView
        
        switch section {
        case .strip(let title, let items):
            view = strip(withTitle: title, items: items)
        }
        stackView.addArrangedSubview(view)
    }
    
    func strip(withTitle title: String, items: [StripItem]) -> UIView {
        let stripView = StripView.instantiate()
        stripView.presenter = stripPresenter
        stripView.title = title
        stripView.items = items
        
        return stripView
    }
}


