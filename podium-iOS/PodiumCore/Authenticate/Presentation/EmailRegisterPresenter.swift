//
//  EmailNewUserPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

final class EmailRegisterPresenter: RegisterPresenter {
    private let repository: AuthenticationRepositoryProtocol
    
    weak var view: RegisterView?
    
    init(repository: AuthenticationRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad() {
        self.view?.update(with: self.registerSections())
    }
    
    private func registerSections() -> [RegisterSection] {
        let registerSections : [RegisterSection] = [
            .field(type: .alias),.field(type: .name)
        ]
        return registerSections
    }
}
