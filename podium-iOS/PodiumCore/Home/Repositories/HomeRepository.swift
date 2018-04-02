//
//  HomeRepository.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol HomeRepositoryProtocol {
    
    func featuredGames() -> Observable<GameResponse>
    func featuredSports() -> Observable<SportResponse>
}

final class HomeRespository: HomeRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func featuredGames() -> Observable<GameResponse> {
        return webService.load(_type: GameResponse.self, from: .featuredGames)
    }
    
    func featuredSports() -> Observable<SportResponse> {
        return webService.load(_type: SportResponse.self, from: .featuredSports)
    }
}
