//
//  SportsPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 18/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift
import Kingfisher

final class ThumbPresenter {
    
    func present(thumbItem: ThumbItem, in cell: ThumbItemCell) {
        if  thumbItem.thumbnail.range(of: "default") != nil || thumbItem.thumbnail.isEmpty {
            cell.imageView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
       } else {
            cell.imageView.kf.setImage(with: URL(string: thumbItem.thumbnail))
       }
    }
}
