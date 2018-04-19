//
//  NewUserPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

protocol RegisterView : class {
    var title: String? { get set }
    func update(with sections: [RegisterSection])
    func updateSection(with sports: [Sport])
}

protocol RegisterPresenter: class {
    weak var view: RegisterView? { get set }
    
    func didLoad()
    func submit(withUserData data: [String:String])
}
