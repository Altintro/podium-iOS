//
//  ChooseSportPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 22/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

protocol ChooseSportView: class {
    
}

final class ChooseSportPresenter {
    
    weak var view: ChooseSportView?
    
    func didLoad () {
        // load sports from repository
    }
}
