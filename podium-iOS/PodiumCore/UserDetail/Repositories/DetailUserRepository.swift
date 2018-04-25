//
//  DetailUserRepository.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol DetailUserRepositoryProtocol {
    func user(withIdentifier identifier:String) -> Observable<DetailResponse<User>>
}

final class DetailUserRepository : DetailUserRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func user(withIdentifier identifier:String) -> Observable<DetailResponse<User>> {
        return webService.load(_type: DetailResponse<User>.self, from: .user(id: identifier
            ))
    }
    
}
