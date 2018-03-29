//
//  AuthenticationInteractor.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol AuthenticationRepositoryProtocol {
    func googleConnect(token: String) -> Observable<RegisterResponse>
    func emailConnect(email: String) -> Observable<CheckResponse>
    func checkAlias(alias: String) -> Observable<CheckResponse>
}

final class AuthenticationRepository: AuthenticationRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func googleConnect(token: String) -> Observable<RegisterResponse> {
        return webService.load(_type: RegisterResponse.self, from: .googleConnect(token: token))
    }
    
    func emailConnect(email: String) -> Observable<CheckResponse> {
        return webService.load(_type: CheckResponse.self, from: .emailConnect(email: email))
    }
    
    func checkAlias(alias: String) -> Observable<CheckResponse> {
        return webService.load(_type: CheckResponse.self, from: .checkAlias(alias: alias))
    }
}

