//
//  FinishViewController.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import UIKit
import RxGesture
import RxSwift

class FinishViewController: UIViewController {

    let presenter : FinishPresenter
    private let disposeBag = DisposeBag()
    
    init(presenter: FinishPresenter){
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
        view.rx.swipeGesture(.up)
            .when(.recognized)
            .subscribe(onNext: { _ in
                self.presenter.didSwipeUp()
            })
            .disposed(by: disposeBag)
    }
}

extension FinishViewController: FinishView {
    
    
}
