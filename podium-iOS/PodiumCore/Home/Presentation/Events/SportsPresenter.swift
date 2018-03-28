//
//  SportsPresenter.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/28/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

final class SportsPresenter {
    
    func present(sport: Sport, in cell: EventCell) {
        
        cell.eventName.text = sport.name
        cell.eventImageView.backgroundColor = UIColor.lightGray
    }
}
