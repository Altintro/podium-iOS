//
//  DetailGameSection.swift
//  podium-iOS
//
//  Created by Fernando Frances on 25/04/2018.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//

import Foundation

enum DetailGameSection {
    case header(DetailGameHeader)
    case thumView(title: String, items: [ThumbItem])
    case join(title: String)
}

struct DetailGameHeader {
    let sport: String
    let name: String
    let location: String
    let date: String
}

extension DetailGameHeader {
    init(game: Game, dateFormatter: DateFormatter){
        name = game.name
        sport = game.sport?.name ?? ""
        // TODO: get city from latitude and longitude
        location = "Madrid"
        
        let dateOfGame = game.date.flatMap { dateFormatter.date(from: $0) }
        let day = (dateOfGame?.day).map { String($0) }
        let hour = (dateOfGame?.hour).map { String($0) }
        let dateString = [day, hour].flatMap { $0 }.joined(separator: "at")
        //Dummy date
        date = !dateString.isEmpty ? dateString : "Friday at 5:30pm"
    }
}

