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
    private let sportsPresenter: SportsPresenter
    
    @IBOutlet weak var stackView: UIStackView!
    
    init(presenter: HomePresenter,
        eventsPresenter: EventsPresenter,
        sportsPresenter: SportsPresenter) {
        
        self.presenter = presenter
        self.eventsPresenter = eventsPresenter
        self.sportsPresenter = sportsPresenter
        
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
    
    func update(with sports: [Sport], categoryTitle: String) {
       
        let sportsView = SportsView.instantiate()
        sportsView.presenter = sportsPresenter
        sportsView.title = categoryTitle
        sportsView.items = sports
        
        stackView.addArrangedSubview(sportsView)
    }
    
    
    func update(with games: [Game], categoryTitle:String) {
        
        let eventsView = EventView.instantiate()
        eventsView.presenter = eventsPresenter
        eventsView.title = categoryTitle
        eventsView.items = games
        
        stackView.addArrangedSubview(eventsView)
        
    }
}

