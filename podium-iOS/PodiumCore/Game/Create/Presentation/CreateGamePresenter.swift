//
//  CreateGamePresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import RxSwift

protocol CreateGameView: class {
   
}

final class CreateGamePresenter {
    
    private let repository: CreateGameRepositoryProtocol
    private let disposeBag = DisposeBag()
    
    weak var view: CreateGameView?
    
    init(repository: CreateGameRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad () {
        
    }
}
