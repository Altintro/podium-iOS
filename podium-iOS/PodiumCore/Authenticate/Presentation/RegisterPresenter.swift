//
//  NewUserPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol RegisterView : class {
    var title: String? { get set }
    func update(with sections: [RegisterSection])
}

protocol RegisterPresenter: class {
    weak var view: RegisterView? { get set }
    
    func didLoad()
}
