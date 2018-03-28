//
//  HomeRepository.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/24/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol HomeRepositoryProtocol {
    
    func allGames() -> Observable<GamesResponse>
}

final class HomeRespository: HomeRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func allGames() -> Observable<GamesResponse> {
        return webService.load(_type: GamesResponse.self, from: .games)
    }
}
