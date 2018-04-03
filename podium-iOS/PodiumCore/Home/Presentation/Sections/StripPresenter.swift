//
//  StripPresenter.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/26/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

final class StripPresenter {
    
    func present(item: StripItem, in cell: StripCell) {
        
        cell.title.text = item.title
        cell.imageView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    }
}

