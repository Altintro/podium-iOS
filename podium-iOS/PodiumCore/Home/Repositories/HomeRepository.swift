//
//  HomeRepository.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol HomeRepositoryProtocol {
    
    func featuredGames() -> Observable<ListResponse<Game>>
    func featuredSports() -> Observable<ListResponse<Sport>>
}

final class HomeRespository: HomeRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func featuredGames() -> Observable<ListResponse<Game>> {
        return webService.load(_type: ListResponse<Game>.self, from: .featuredGames)
    }
    
    func featuredSports() -> Observable<ListResponse<Sport>> {
        return webService.load(_type: ListResponse<Sport>.self, from: .sports)
    }
}

