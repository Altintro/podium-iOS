//
//  AuthenticationInteractor.swift
//  podium-iOS
//
//  Created by Fernando Frances on 14/03/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

protocol AuthenticationRepositoryProtocol {
    func registerUser(userRegistration:[String: String]) -> Observable<RegisterResponse>
    func googleSignIn(token: String) -> Observable<RegisterResponse>
}

final class AuthenticationRepository: NSObject, AuthenticationRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func registerUser(userRegistration: [String: String]) -> Observable<RegisterResponse> {
        return webService.load(_type: RegisterResponse.self, from: .register(user:userRegistration))
    }
    
    func googleSignIn(token: String) -> Observable<RegisterResponse> {
        return webService.load(_type: RegisterResponse.self, from: .googleSignIn(token: token))
    }
}

