//
//  DetailGameViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxSwift
import RxGesture

protocol DetailGameViewControllerProvider: class {
    func detailGameViewController(identifier: String) -> UIViewController
}

class DetailGameViewController: UIViewController, CustomNavigationButtonsView {
    
    @IBOutlet weak var stackView: UIStackView!
    
    private let presenter: DetailGamePresenter
    private let headerPresenter: DetailGameHeaderPresenter
    private let thumbPresenter: ThumbPresenter
    
    init(presenter: DetailGamePresenter, headerPresenter: DetailGameHeaderPresenter, thumbPresenter: ThumbPresenter){
        self.presenter = presenter
        self.headerPresenter = headerPresenter
        self.thumbPresenter = thumbPresenter
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureBackButton()
        presenter.view = self
        presenter.didLoad()
    }

}

extension DetailGameViewController: DetailGameView {
    func update(with sections: [DetailGameSection]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        sections.forEach { addView(for: $0) }
    }
    
    func reload(){
        self.viewDidLoad()
    }
}

private extension DetailGameViewController {
    func addView(for section: DetailGameSection){
        let view: UIView
        
        switch section {
        case .header(let header):
            view = headerView(with: header)
        case .thumView(let title, let items):
            view = participantsview(with: title, items: items)
        case .join(let title):
            view = joinView(with: title)
        }
        
        stackView.addArrangedSubview(view)
        
    }
    
    func headerView(with header: DetailGameHeader) -> UIView {
        let headerView = DetailGameHeaderView.instantiate()
        headerPresenter.present(header: header, in: headerView)
        
        return headerView
    }
    
    func participantsview(with title: String, items: [ThumbItem]) -> UIView{
        let thumbView = ThumbView.instantiate()
        thumbView.presenter = thumbPresenter
        thumbView.items = items
        thumbView.title = title
        thumbView.itemSelected
            .subscribe(onNext: {[weak self] item in
                self?.presenter.didSelectParticipant(withIdentifier: item.identifier)
            })
            .disposed(by: thumbView.disposeBag)
        
        return thumbView
    }
    
    func joinView(with title: String) -> UIView {
        let joinView = SubmitView.instantiate()
        joinView.submitButton.setTitle(title, for: .normal)
        joinView.submitButton.rx.tap.bind {
            self.presenter.joinGame()
        }
        return joinView
    }
}
