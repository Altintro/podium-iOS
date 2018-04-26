//
//  ChooseMetadataPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 23/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

protocol ChooseMetadataView: class {
    
}

final class ChooseMetadataPresenter {
    weak var view: ChooseMetadataView?
    weak var delegate: CreateSectionDelegate?
    
    func didLoad(){
        
    }
    
    func showNext(data: [String: String]){
        delegate?.showNext(current: .metadata, data: data)
    }
}
