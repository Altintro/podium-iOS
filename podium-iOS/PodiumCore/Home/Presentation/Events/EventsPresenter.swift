//
//  EventPresenter.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/26/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import RxSwift

final class EventsPresenter {
    
    func present(game: Game, in cell: EventCell) {
        
        cell.eventName.text = game.name
    }
}
