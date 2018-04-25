//
//  GameDetailRepository.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailGameRepositoryProtocol {
    func game(withIdentifier identifier: String) -> Observable<DetailResponse<Game>>
    func joinGame(withIdentifier identifier: String) -> Observable<PostResponse<Game>>
}

final class DetailGameRepository : DetailGameRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func game(withIdentifier identifier: String) -> Observable<DetailResponse<Game>> {
        return webService.load(_type: DetailResponse<Game>.self, from: .game(id: identifier))
    }
    
    func joinGame(withIdentifier identifier: String) -> Observable<PostResponse<Game>> {
        return webService.load(_type: PostResponse<Game>.self, from: .joinGame(id: identifier))
    }
}
