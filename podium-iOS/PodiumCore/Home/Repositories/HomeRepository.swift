//
//  HomeRepository.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol HomeRepositoryProtocol {
    
    func featuredGames() -> Observable<HomeResponse<Game>>
    func featuredSports() -> Observable<HomeResponse<Sport>>
}

final class HomeRespository: HomeRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func featuredGames() -> Observable<HomeResponse<Game>> {
        return webService.load(_type: HomeResponse<Game>.self, from: .featuredGames)
    }
    
    func featuredSports() -> Observable<HomeResponse<Sport>> {
        return webService.load(_type: HomeResponse<Sport>.self, from: .featuredSports)
    }
}

