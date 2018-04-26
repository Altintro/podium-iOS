//
//  CreateGameRepository.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import RxSwift

protocol CreateGameRepositoryProtocol {
    func createGame(with data:[String: String]) -> Observable<CreateGameResponse>
    func sports() -> Observable<ListResponse<Sport>>
    func users() -> Observable<ListResponse<User>>
}

final class CreateGameRepository: CreateGameRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func createGame(with data: [String : String]) -> Observable<CreateGameResponse> {
        return webService.load(_type: CreateGameResponse.self, from: .createGame(data: data))
    }
    
    func sports() -> Observable<ListResponse<Sport>> {
        return webService.load(_type: ListResponse<Sport>.self, from: .sports)
    }
    
    func users() -> Observable<ListResponse<User>> {
        return webService.load(_type: ListResponse<User>.self, from: .users)
    }
}
