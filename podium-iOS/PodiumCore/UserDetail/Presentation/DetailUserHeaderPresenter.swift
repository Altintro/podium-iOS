//
//  DetailUserHeaderPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 24/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation
import Kingfisher

final class DetailUserHeaderPresenter {
    func present(header: DetailUserHeader, in view: DetailUserHeaderView) {
        view.title.text = header.name
        view.subtitle.text = header.alias
        view.profilePic.kf.setImage(with: URL(string:header.profilePic ?? ""))
        
    }
}
