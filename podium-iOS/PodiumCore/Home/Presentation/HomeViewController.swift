//
//  HomeViewController.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let presenter: HomePresenter
    private let eventsPresenter: EventsPresenter
    
    @IBOutlet weak var stackView: UIStackView!
    
    init(presenter: HomePresenter,
        eventsPresenter: EventsPresenter) {
        
        self.presenter = presenter
        self.eventsPresenter = eventsPresenter
        
        super.init(nibName: "Home", bundle: Bundle(for: type(of: self)))
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
    
    func update(with games: [Game]) {
        
        let eventsView = EventView.instantiate()
        eventsView.presenter = eventsPresenter
        eventsView.title = "Recientes"
        eventsView.items = games
        
        stackView.addArrangedSubview(eventsView)
        
    }
}

