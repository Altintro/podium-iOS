//
//  StripPresenter.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/26/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift
import Kingfisher

final class StripPresenter {
    
    func present(item: StripItem, in cell: StripCell) {
        
        cell.title.text = item.title
        cell.subtitle.text = item.sport.uppercased()
        
        let thumbnails = cell.background.subviews.filter { $0.isKind(of: UIImageView.self) }
        var i: Int = 0
        item.participants.forEach {
            let imageView = thumbnails[i] as! UIImageView
            imageView.kf.setImage(with: URL(string:$0.profilePic))
            i += 1
        }
    }
}

