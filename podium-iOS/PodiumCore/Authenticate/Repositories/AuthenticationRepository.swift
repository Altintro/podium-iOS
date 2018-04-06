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
    func emailConnect(email: String) -> Observable<RegisterResponse>
    func emailRegister(user: [String:String]) -> Observable<RegisterResponse>
    func me() -> Observable<User>
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
    
    func emailConnect(email: String) -> Observable<RegisterResponse> {
        return webService.load(_type: RegisterResponse.self, from: .emailConnect(email: email))
    }
    
    func emailRegister(user: [String:String]) -> Observable<RegisterResponse> {
        return webService.load(_type: RegisterResponse.self, from: .emailRegister(user: user))
    }
    
    func me() -> Observable<User> {
        return webService.load(_type: User.self, from: .me)
    }
    
    func checkAlias(alias: String) -> Observable<CheckResponse> {
        return webService.load(_type: CheckResponse.self, from: .checkAlias(alias: alias))
    }
}

