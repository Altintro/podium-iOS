//
//  SportsPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 18/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift
import Kingfisher

final class SportsPresenter {
    
    func present(item: Sport?, in cell: SportCell) {
        if let urlString = item?.image {
            cell.imageView.kf.setImage(with: URL(string: urlString))
        } else {
            cell.imageView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        }
    }
}
