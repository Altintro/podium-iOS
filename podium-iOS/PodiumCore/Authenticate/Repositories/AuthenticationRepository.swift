//
//  AuthenticationInteractor.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol AuthenticationRepositoryProtocol {
    func googleConnect(token: String) -> Observable<AuthenticationResponse>
    func facebookConnect(token: String) -> Observable<AuthenticationResponse>
    func emailConnect(email: String) -> Observable<AuthenticationResponse>
    func emailRegister(data: [String:String]) -> Observable<AuthenticationResponse>
    func socialRegister(data: [String: String]) -> Observable<AuthenticationResponse>
    func tokens() -> Observable<AuthenticationResponse>
    func checkAlias(alias: String) -> Observable<CheckResponse>
    func sports() -> Observable<ListResponse<Sport>>
}

final class AuthenticationRepository: AuthenticationRepositoryProtocol {
    
    private let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func googleConnect(token: String) -> Observable<AuthenticationResponse> {
        return webService.load(_type: AuthenticationResponse.self, from: .googleConnect(token: token))
    }
    
    func facebookConnect(token: String) -> Observable<AuthenticationResponse> {
        return webService.load(_type: AuthenticationResponse.self, from: .facebookConnect(token: token))
    }
    
    func emailConnect(email: String) -> Observable<AuthenticationResponse> {
        return webService.load(_type: AuthenticationResponse.self, from: .emailConnect(email: email))
    }
    
    func emailRegister(data: [String:String]) -> Observable<AuthenticationResponse> {
        return webService.load(_type: AuthenticationResponse.self, from: .emailRegister(data: data))
    }
    
    func socialRegister(data: [String: String]) -> Observable<AuthenticationResponse> {
        return webService.load(_type: AuthenticationResponse.self, from: .socialRegister(data: data))
    }
    
    func tokens() -> Observable<AuthenticationResponse> {
        return webService.load(_type: AuthenticationResponse.self, from: .tokens)
    }
    
    func checkAlias(alias: String) -> Observable<CheckResponse> {
        return webService.load(_type: CheckResponse.self, from: .checkAlias(alias: alias))
    }
    
    func sports() -> Observable<ListResponse<Sport>> {
        return webService.load(_type: ListResponse<Sport>.self, from: .sports)
    }
}

