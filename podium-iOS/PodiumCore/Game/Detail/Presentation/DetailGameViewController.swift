//
//  DetailGameViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit

class DetailGameViewController: UIViewController {
    
    private let presenter: DetailGamePresenter
    
    init(presenter: DetailGamePresenter){
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
    }

}

extension DetailGameViewController: DetailGameView {
    func update(with game: Game) {
        // Update sections with game
    }
}
