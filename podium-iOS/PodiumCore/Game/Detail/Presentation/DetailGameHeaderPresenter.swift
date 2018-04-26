//
//  DetailGameHeaderPresenter.swift
//  podium-iOS
//
//  Created by Fernando Frances on 26/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

final class DetailGameHeaderPresenter {
    func present(header: DetailGameHeader, in view: DetailGameHeaderView){
        view.title.text = header.name
        view.overTitle.text = header.sport.uppercased()
        view.dateLabel.text = header.date
        view.locationLabel.text = header.location
    }
}
