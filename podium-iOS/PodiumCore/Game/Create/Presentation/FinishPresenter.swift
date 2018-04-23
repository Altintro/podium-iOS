//
//  FinishPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

protocol FinishView : class {

}

final class FinishPresenter {
    
    weak var view: FinishView?
    weak var delegate: CreateSectionDelegate?
    
    func didLoad() {
        // Download Graphics for game created successfully
    }
    
    func didSwipeUp() {
        delegate?.dismiss()
    }
}
