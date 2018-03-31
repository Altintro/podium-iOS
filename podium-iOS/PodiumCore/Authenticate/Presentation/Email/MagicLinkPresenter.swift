//
//  MagicLinkPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 28/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol MagicLinkView: class {
    var title: String? { get set }
}

final class MagicLinkPresenter {
    
    weak var view: MagicLinkView?
    
    func didLoad() {
        view?.title = NSLocalizedString("Magic Link", comment: "")
    }
}
