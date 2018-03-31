//
//  SocialRegisterPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 30/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

final class SocialRegisterPresenter: RegisterPresenter {
    private let repository: AuthenticationRepositoryProtocol
    
    weak var view: RegisterView?
    
    init(repository: AuthenticationRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad() {
        
    }
    
    func submit(withUserData data: [String : String]) {
        // update alias of user
    }
    
}
